function control_exec(environment, P, Ts, samples, title_plot)

    
%% ************************************************************************
    %% DYNAMIC PLOTS
    import data_input.plot_input;
    DYNAMIC_ON = plot_input();
    if strcmpi(DYNAMIC_ON, "d")
        DYNAMIC_ON=1;
    elseif strcmpi(DYNAMIC_ON, "s")
        DYNAMIC_ON=0;
    else
        error("Input non valido.")
    end
    
    
%% ************************************************************************
    %% TRAJECTORY GENERATION
    import control.trajectory_tracking.trajectory_generation;
    [xstar, ystar, xdstar, ydstar, xddstar, yddstar, thetastar]...
                                           = trajectory_generation(P, samples);
    x0 = xstar(1)-0.1;
    y0 = ystar(1)+0.1;
    theta0 = thetastar(1)+deg2rad(0.1);
    X0 = [x0 y0 theta0];
    
    
    %% TRAJECTORY TRACKING
    import control.trajectory_tracking.trajectory_tracking_exec;
    [evolutionAL, evolutionNL, evolutionFL] = trajectory_tracking_exec(DYNAMIC_ON,...
                                                                       environment,...
                                                                       Ts, samples, X0,...
                                                                       xstar, ystar,...
                                                                       xdstar, ydstar, ...
                                                                       xddstar, yddstar,...
                                                                       thetastar,...
                                                                       title_plot, P);
                                                                   
    hold off;                                           
%% ************************************************************************
    %% POSTURE REGULATION
    import control.posture_regulation.posture_regulation_exec;
    t_simulazione = 7000;
    angle = (270/180)*pi;
    nr_subplot=2; nc_subplot=3;
    if isequal(DYNAMIC_ON, 0)
        f=figure(); f.Position=[25 100 1500 600];
    end
    
    if isequal(DYNAMIC_ON, 1)
        import data_input.control_input;
        c = control_input();
    end
    
    if isequal(DYNAMIC_ON, 1)
        subplot_index=0; title_evolution="";
        if strcmpi(c, "l")
            posture_regulation_exec(DYNAMIC_ON, evolutionAL, Ts, angle, t_simulazione,...
                                       nr_subplot, nc_subplot, subplot_index, title_evolution);
        elseif strcmpi(c, "n")
            posture_regulation_exec(DYNAMIC_ON, evolutionNL, Ts, angle, t_simulazione,...
                                       nr_subplot, nc_subplot, subplot_index, title_evolution);
        elseif strcmpi(c, "io")
            posture_regulation_exec(DYNAMIC_ON, evolutionFL, Ts, angle, t_simulazione,...
                                       nr_subplot, nc_subplot, subplot_index, title_evolution);
        else
            error("Input non valido.")
        end
    elseif isequal(DYNAMIC_ON, 0)
        subplot_index=1; title_evolution="APPROXIMATED LINEARIZATION";
        posture_regulation_exec(DYNAMIC_ON, evolutionAL, Ts, angle, t_simulazione,...
                                       nr_subplot, nc_subplot, subplot_index, title_evolution);
        subplot_index=2; title_evolution="NON-LINEARIZATION";
        posture_regulation_exec(DYNAMIC_ON, evolutionNL, Ts, angle, t_simulazione,...
                                       nr_subplot, nc_subplot, subplot_index, title_evolution);
        subplot_index=3; title_evolution="INPUT-OUTPUT LINEARIZATION";
        posture_regulation_exec(DYNAMIC_ON, evolutionFL, Ts, angle, t_simulazione,...
                                       nr_subplot, nc_subplot, subplot_index, title_evolution);
    else
        error("Input non valido.");
    end
    
    if isequal(DYNAMIC_ON, 0)
        sgtitle(title_plot + " POSTURE REGULATION")
    end


    
end