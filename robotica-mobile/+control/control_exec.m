function control_exec(environment, P, Ts, samples)

    
%% ************************************************************************
    %% DYNAMIC PLOTS
    % valore input per scegliere se avere plot dinamici per ogni algoritmo
    % di controllo:
    % - 0 : solo plot statici
    % - 1 : sia plot statici che dinamici
    DYNAMIC_ON = 1;
    
    
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
                                                                       thetastar);
                                                                   
                                                                
%% ************************************************************************
    %% POSTURE REGULATION
    import control.posture_regulation.posture_regulation_exec;
    t_simulazione = 7000;
    angle = (270/180)*pi;
    posture_regulation_exec(DYNAMIC_ON, evolutionAL, Ts, angle, t_simulazione);
    posture_regulation_exec(DYNAMIC_ON, evolutionNL, Ts, angle, t_simulazione);
    posture_regulation_exec(DYNAMIC_ON, evolutionFL, Ts, angle, t_simulazione);


    
    

    
    
   
    
    
    
    
end