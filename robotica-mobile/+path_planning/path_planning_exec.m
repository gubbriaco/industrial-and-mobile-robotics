function path_planning_exec(environment)
    % sono presenti diversi path planning ognuno progettato tale per cui in
    % output viene restituita la traiettoria risultante da esso cosi' da
    % essere utilizzata per gli algoritmi di controllo progettati
    
    % i path planning progettati sono:
    % - ARTIFICIAL POTENTIAL FIELDS
    % - DISCRETE POTENTIAL FIELDS
    % - VORONOI DIAGRAMS
    % - VISIBILITY GRAPHS

    global start goal obstacles width height grid X Y
    import control.control_exec;
    
    
%% ************************************************************************
    %% ARTIFICIAL POTENTIAL FIELDS
    obstacle_height=1;
    add_obstacles(environment, obstacle_height);
%     plot(environment);
    import path_planning.artificial_potential_fields.artificial_potential_fields;
    P = artificial_potential_fields(environment);
    figure(); plot2D(environment);
    hold on; plot(P(:,1), P(:,2), "DisplayName","shortest path"); 
    title("ARTIFICIAL POTENTIAL FIELDS SHORTEST PATH");
    legend("Location","northwest");
    Ts = 0.1; samples = (length(P)/Ts)*2;
    control_exec(environment, P, Ts, samples);

    return
%% ************************************************************************  
    %% DISCRETE POTENTIAL FIELDS
    obstacle_height=Inf; add_obstacles(environment, obstacle_height);
    plot(environment);
    import path_planning.discrete_potential_fields.discrete_potential_fields;
    P = discrete_potential_fields(start, goal, width, height, grid, obstacles);
    figure(); plot2D(environment);
    hold on; plot(P(:,1), P(:,2), "DisplayName","shortest path"); 
    title("DISCRETE POTENTIAL FIELDS SHORTEST PATH");
    legend("Location","northwest");
    Ts = 0.1; samples = (length(P)/Ts)*2;
    control_exec(environment, P, Ts, samples);

    
%% ************************************************************************   
    %% VORONOI DIAGRAMS
    obstacle_height=1; add_obstacles(environment, obstacle_height);
    plot(environment);
    import path_planning.voronoi_diagram.voronoi;
    P = voronoi(start, goal, X, Y, grid, obstacles);
    figure(); plot2D(environment);
    hold on; plot(P(:,1), P(:,2), "DisplayName","shortest path"); 
    title("VORONOI DIAGRAMS SHORTEST PATH");
    legend("Location","northwest");
    Ts = 0.1; samples = length(P)/Ts;
    control_exec(environment, P, Ts, samples);

    
%% ************************************************************************    
    %% VISIBILITY GRAPH
    obstacle_height=1;
    add_obstacles(environment, obstacle_height);
    plot(environment);
    import path_planning.visibility_graph.visibility_graph;
    P = visibility_graph(start, goal, obstacles);
    figure(); plot2D(environment);
    hold on; plot(P(:,1), P(:,2), "DisplayName","shortest path");
    title("VISIBILITY GRAPH SHORTEST PATH");
    legend("Location","northwest");
    import path_planning.visibility_graph.cleanup;
    P = cleanup(P);
    import path_planning.visibility_graph.discretize_distances;
    Ts = 0.1;
    samples = (length(P)/Ts);
    P = discretize_distances(P, samples);
    Ts = 0.1;
    samples = (length(P)/Ts)*7;
    control_exec(environment, P, Ts, samples);



end