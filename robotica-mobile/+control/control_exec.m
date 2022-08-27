function control_exec(environment, P, Ts, samples)

    
%% ************************************************************************
    %% DYNAMIC PLOTS
    % valore input per scegliere se avere plot dinamici per ogni algoritmo
    % di controllo:
    % - 0 : solo plot statici
    % - 1 : sia plot statici che dinamici
    DYNAMIC_ON = 0;
    
    
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
    [evolutionAL, evolutionNL, evolutionFL] = trajectory_tracking_exec(Ts, samples, X0,...
                                                                       xstar, ystar,...
                                                                       xdstar, ydstar, ...
                                                                       xddstar, yddstar,...
                                                                       thetastar);

    return;
%% ************************************************************************
%% POSTURE REGULATION
import control.posture_regulation.cartesian_regulation.cartesian_regulation;
import control.posture_regulation.complete_regulation.complete_regulation;
global start goal
    
    t_simulazione = 7000;
    angle = (270/180)*pi;
    
    
    x0=evolutionAL(end,1); y0=evolutionAL(end,2); theta0=evolutionAL(end,3);
    X0 = [x0 ; y0 ; theta0];
    
    xf=goal(1); yf=goal(2); thetaf=angle;
    Xf = [xf ; yf ; thetaf];
    
    
    cartesian_postureAL = @(X)(cartesian_regulation(X, Xf, Ts));
    complete_postureAL = @(X)(complete_regulation(X, Xf, Ts));
    
    
    %% CARTESIAN REGULATION
    postureAL(1,:)=X0;
    Xdot = cartesian_postureAL(X0);
    for k = 2 : t_simulazione
        X0 = Xdot;
        Xdot = cartesian_postureAL(X0);
        
        
        postureAL(k,1) = Xdot(1);
        postureAL(k,2) = Xdot(2);
        % utilizzo la funzione enroll_theta affinche' l'angolo rimanga
        % nell'intervallo [-pi, pi]
        import control.posture_regulation.enroll_theta;
        postureAL(k,3) = enroll_theta(Xdot(3));
    end
    
    postureAL = [evolutionAL ; postureAL];
    
    f=figure(); f.Position=[250 342 1000 420]; subplot(1,2,1); 
    axis([0 100 0 100]); hold on;
    plot(start(1), start(2), "*", "Color","blue");
    plot(goal(1), goal(2), "*", "Color","green");
    plot(postureAL(:,1), postureAL(:,2), "or");
    import control.posture_regulation.plot_triangle;
    plot_triangle([postureAL(end,1),postureAL(end,2)], postureAL(end,3));
    
    if isequal(DYNAMIC_ON, 1)
        figure(); axis([0 100 0 100]); hold on; 
        import control.posture_regulation.plot_robot;
        plot_robot(postureAL);
    end
    

%% COMPLETE REGULATION
    postureAL=[];
    postureAL(1,:)=X0;
    Xdot = complete_postureAL(X0);
    for k = 2 : t_simulazione
        X0 = Xdot;
        Xdot = complete_postureAL(X0);
        
        
        postureAL(k,1) = Xdot(1);
        postureAL(k,2) = Xdot(2);
        % utilizzo la funzione enroll_theta affinche' l'angolo rimanga
        % nell'intervallo [-pi, pi]
        import control.posture_regulation.enroll_theta;
        postureAL(k,3) = enroll_theta(Xdot(3));
    end
    
    postureAL = [evolutionAL ; postureAL];
    
    subplot(1,2,2); axis([0 100 0 100]); hold on; 
    plot(start(1), start(2), "*", "Color","blue");
    plot(goal(1), goal(2), "*", "Color","green");
    plot(postureAL(:,1), postureAL(:,2), "or");
    import control.posture_regulation.plot_triangle;
    plot_triangle([postureAL(end,1),postureAL(end,2)], postureAL(end,3));
    
    if isequal(DYNAMIC_ON, 1)
        figure(); axis([0 100 0 100]); hold on; 
        import control.posture_regulation.plot_robot;
        plot_robot(postureAL);
    end
    
    
    x = postureAL(:,1);
    y = postureAL(:,2);
    theta = postureAL(:,3);
    
    
    figure(); hold on; grid on;
    plot(x0, y0, "og", "LineWidth",2); plot(xf, yf, "or", "LineWidth",2);
    for k = 1 : size(evolutionAL,1)
        plot(x, y, "ob", "LineWidth",2);
        hold on;
    end
    
    
    
    
end