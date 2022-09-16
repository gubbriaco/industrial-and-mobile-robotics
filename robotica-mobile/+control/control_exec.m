function control_exec(environment, P, Ts, samples, title_plot)

    
%% ************************************************************************
    %% DYNAMIC PLOTS
    % valore input per scegliere se avere plot dinamici per ogni algoritmo
    % di controllo:
    % - 0 : solo plot statici
    % - 1 : sia plot statici che dinamici
    disp(" "); disp(" ");
    disp("Scegliere se effettuare plot statici o dinamici.");
    disp("I formati di input per la tipologia di plot:");
    disp("static := static plot");
    disp("dynamic := dynamic plot");
    disp(" ");
    DYNAMIC_ON = input("Inserire la tipologia di path planning da simulare: ", "s");
    DYNAMIC_ON = "" + DYNAMIC_ON;
    if strcmpi(DYNAMIC_ON, "dynamic")
        DYNAMIC_ON=1;
    elseif strcmpi(DYNAMIC_ON, "static")
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
                                                                       title_plot);
                                                                   
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
        disp(" "); disp(" ");
        disp("Scegliere la tipologia di controllo a cui applicare la posture regulation:");
        disp("linear := linear control");
        disp("non := non linear control");
        disp("io := input-output control");
        disp(" ");
        c = input("Inserire la tipologia di controllo: " , "s");
        c = "" + c;
    end
    
    if isequal(DYNAMIC_ON, 1)
        subplot_index=0; title_evolution="";
        if strcmpi(c, "linear")
            posture_regulation_exec(DYNAMIC_ON, evolutionAL, Ts, angle, t_simulazione,...
                                       nr_subplot, nc_subplot, subplot_index, title_evolution);
        elseif strcmpi(c, "non")
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