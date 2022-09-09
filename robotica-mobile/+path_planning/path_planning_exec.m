function path_planning_exec(environment)
    % In tale function e' presente l'implementazione di diversi path 
    % planning tale che per ognuno viene restituita in output la 
    % traiettoria generata per raggiungere il goal (partendo da un 
    % determinato punto di start). La traiettoria generata in output viene 
    % messa in input alla function control_exec. Inoltre, discretizzo in 
    % maniera da processare un campione per volta. (Nel caso del Visibility
    % Graph viene effettuata una doppia discretizzazione con tempo di 
    % campionamento differente cosi' da avere un numero di campioni 
    % adeguato e sufficiente per applicare gli algoritmi di controllo, 
    % essendo che i punti (vertici del grafo che compongono lo shortest 
    % path in questione) sono pochi per avere un risultato adeguato a 
    % fronte dell'applicazione degli algoritmi di controllo.
    % @see control.control_exec
    
    % I path planning progettati sono:
    % - ARTIFICIAL POTENTIAL FIELDS
    % - DISCRETE POTENTIAL FIELDS
    % - VORONOI DIAGRAMS
    % - VISIBILITY GRAPHS

    global start goal obstacles width height grid
    import control.control_exec;
    
    
    % l'obiettivo e' raggiungere una determinata posizione (goal), partendo
    % da una posizione di partenza (start), evitando gli ostacoli presenti
    % nell'ambiente
    
    
%% ************************************************************************
    %% ARTIFICIAL POTENTIAL FIELDS
    obstacle_height=1; add_obstacles(environment, obstacle_height);
    import path_planning.artificial_potential_fields.artificial_potential_fields;
    P = artificial_potential_fields(environment);
    figure(); plot2D(environment);
    hold on; plot(P(:,1),P(:,2), "DisplayName","shortest path"); 
    title("ARTIFICIAL POTENTIAL FIELDS SHORTEST PATH");
    legend("Location","northwest");
    Ts=0.1; samples=(length(P)/Ts)*2;
    title_plot = "ARTIFICIAL POTENTIAL FIELDS";
    control_exec(environment, P, Ts, samples, title_plot);

    
% ************************************************************************  
    %% DISCRETE POTENTIAL FIELDS
    obstacle_height=Inf; add_obstacles(environment, obstacle_height);
    import path_planning.discrete_potential_fields.discrete_potential_fields;
    P = discrete_potential_fields(start, goal, width, height, grid, obstacles);
    figure(); plot2D(environment);
    hold on; plot(P(:,1),P(:,2), "DisplayName","shortest path"); 
    title("DISCRETE POTENTIAL FIELDS SHORTEST PATH");
    legend("Location","northwest");
    Ts=0.1; samples=(length(P)/Ts)*2;
    title_plot = "DISCRETE POTENTIAL FIELDS";
    control_exec(environment, P, Ts, samples, title_plot);

    
%% ************************************************************************   
    %% VORONOI DIAGRAMS
    obstacle_height=1; add_obstacles(environment, obstacle_height);
    import path_planning.voronoi_diagram.voronoi;
    P = voronoi(environment);
    figure(); plot2D(environment);
    hold on; plot(P(:,1),P(:,2), "DisplayName","shortest path"); 
    title("VORONOI DIAGRAMS SHORTEST PATH");
    legend("Location","northwest");
    Ts=0.1; samples=length(P)/Ts;
    title_plot = "VORONOI DIAGRAMS";
    control_exec(environment, P, Ts, samples, title_plot);

    
%% ************************************************************************    
    %% VISIBILITY GRAPH
    obstacle_height=1; add_obstacles(environment, obstacle_height);
    import path_planning.visibility_graph.visibility_graph;
    P = visibility_graph(start, goal, obstacles);
    figure(); plot2D(environment);
    hold on; plot(P(:,1),P(:,2), "DisplayName","shortest path");
    title("VISIBILITY GRAPH SHORTEST PATH");
    legend("Location","northwest");
    import path_planning.visibility_graph.cleanup;
    P = cleanup(P);
    import path_planning.visibility_graph.discretize_distances;
    Ts=0.1; samples=(length(P)/Ts);
    P = discretize_distances(P, samples);
    Ts=0.1; samples=(length(P)/Ts)*7;
    title_plot = "VISIBILITY GRAPH";
    control_exec(environment, P, Ts, samples, title_plot);


    
end