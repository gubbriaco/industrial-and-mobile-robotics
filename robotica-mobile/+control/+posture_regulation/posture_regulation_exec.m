function posture_regulation_exec(DYNAMIC_ON, evolution, Ts, angle, t_simulazione,...
                                   nr_subplot, nc_subplot, subplot_index ,title_evolution)

    global goal

    x0=evolution(end,1); y0=evolution(end,2); theta0=evolution(end,3);
    X0 = [x0 ; y0 ; theta0];
    
    xf=goal(1); yf=goal(2); thetaf=angle;
    Xf = [xf ; yf ; thetaf];
    
    
    import control.posture_regulation.cartesian_regulation.cartesian_regulation;
    import control.posture_regulation.complete_regulation.complete_regulation;
    cartesian_posture = @(X)(cartesian_regulation(X, Xf, Ts));
    complete_posture = @(X)(complete_regulation(X, Xf, Ts));
    
    
    import control.posture_regulation.cartesian_regulation.cartesian_regulation_exec;
    import control.posture_regulation.complete_regulation.complete_regulation_exec;
    if isequal(DYNAMIC_ON, 0)
        cartesian_regulation_exec(DYNAMIC_ON, t_simulazione, X0, evolution, cartesian_posture,...
                                  nr_subplot, nc_subplot, subplot_index, title_evolution, angle);
        subplot_index = subplot_index+3;
        complete_regulation_exec(DYNAMIC_ON, t_simulazione, X0, evolution, complete_posture,...
                              nr_subplot, nc_subplot, subplot_index, title_evolution, angle);
    end
    
    if isequal(DYNAMIC_ON, 1)
        import data_input.posture_input;
        p = posture_input();
        if strcmpi(p, "ca")
            cartesian_regulation_exec(DYNAMIC_ON, t_simulazione, X0, evolution, cartesian_posture,...
                                  nr_subplot, nc_subplot, subplot_index, title_evolution, angle);
        elseif strcmpi(p, "co")
            complete_regulation_exec(DYNAMIC_ON, t_simulazione, X0, evolution, complete_posture,...
                              nr_subplot, nc_subplot, subplot_index, title_evolution, angle);
        else
            error("Input non valido.");
        end
    end

end