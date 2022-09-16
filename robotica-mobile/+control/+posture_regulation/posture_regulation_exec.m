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
                                  nr_subplot, nc_subplot, subplot_index, title_evolution);
        subplot_index = subplot_index+3;
        complete_regulation_exec(DYNAMIC_ON, t_simulazione, X0, evolution, complete_posture,...
                              nr_subplot, nc_subplot, subplot_index, title_evolution);
    end
    
    if isequal(DYNAMIC_ON, 1)
        disp(" "); disp(" ");
        disp("Scegliere la tipologia di posture da visualizzare in maniera dinamica:");
        disp("cartesian := cartesian regulation");
        disp("complete := complete regulation");
        disp(" ");
        p = input("Inserire la tipologia di posture regulation: " , "s");
        p = "" + p;
        if strcmpi(p, "cartesian")
            cartesian_regulation_exec(DYNAMIC_ON, t_simulazione, X0, evolution, cartesian_posture,...
                                  nr_subplot, nc_subplot, subplot_index, title_evolution);
        elseif strcmpi(p, "complete")
            complete_regulation_exec(DYNAMIC_ON, t_simulazione, X0, evolution, complete_posture,...
                              nr_subplot, nc_subplot, subplot_index, title_evolution);
        else
            error("Input non valido.");
        end
    end

end