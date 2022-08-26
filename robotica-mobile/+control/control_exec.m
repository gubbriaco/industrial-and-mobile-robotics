function control_exec(environment, P, Ts, samples)
    global goal
    import control.angle.delta_angle;
    angle = delta_angle(360, 90);
    
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
    
 
%% ************************************************************************    
    %% CONTROL BASED ON APPROXIMATE LINEARIZATION
    import control.trajectory_tracking.approximated_linearization.approximated_linearization;
    Xal = [x0 y0 theta0];
    evolutionAL = [];
    for i = 1 : samples
        evolutionAL(i,:) = Xal;
        new_state = approximated_linearization(Ts, Xal, ...
                                               xstar(i), ystar(i), ...
                                               xdstar(i), ydstar(i),...
                                               xddstar(i), yddstar(i), ...
                                               thetastar(i));
       if or((new_state(1)-goal(1))>0.03, (new_state(2)-goal(2))>0.03) 
            break;
       else 
            Xal = new_state;
       end
    end
    
%     % PLOT STATICO
%     f=figure(); f.Position=[25 342 1500 420]; subplot(1,3,1);
%     plot2D(environment);
%     hold on; plot(evolutionAL(:,1), evolutionAL(:,2));
%     title("CONTROL BASED ON APPROXIMATE LINEARIZATION"); 
%     legend("start", "goal", "trajectory output with control","Location","northwest");
%     
%     %PLOT DINAMICO
%     if isequal(DYNAMIC_ON, 1)
%         figure(); plot2D(environment);
%         pause_time = 0.000001;
%         for i=1:length(evolutionAL)
%             hold on; plot(evolutionAL(i,1), evolutionAL(i,2), '.', 'LineWidth',2, 'Color','black');
%             pause( pause_time );
%         end
%         title("CONTROL BASED ON APPROXIMATE LINEARIZATION"); 
%         legend("start", "goal", "trajectory output with control","Location","northwest");
%     end

    
%% ************************************************************************
    %% NON LINEAR CONTROL
    import control.trajectory_tracking.non_linearization.non_linearization;
    Xnl = [x0 y0 theta0];
    evolutionNL = zeros(samples, 3);
    for i = 1 : samples
        evolutionNL(i,:) = Xnl;
        new_state = non_linearization(Ts, Xnl, ...
                                      xstar(i), ystar(i), ...
                                      xdstar(i), ydstar(i),...
                                      xddstar(i), yddstar(i), ...
                                      thetastar(i));
       if or((new_state(1)-goal(1))>0.03, (new_state(2)-goal(2))>0.03) 
            break;
       else 
            Xnl = new_state;
       end
    end
    
%     % PLOT STATICO
%     subplot(1,3,2);
%     plot2D(environment);
%     hold on; plot(evolutionNL(:,1), evolutionNL(:,2));
%     title("NON LINEAR CONTROL"); 
%     legend("start", "goal", "trajectory output with control","Location","northwest");
%     
%     % PLOT DINAMICO
%     if isequal(DYNAMIC_ON, 1)
%         figure(); plot2D(environment);
%         pause_time = 0.000001;
%         for i=1:length(evolutionNL)
%             hold on; plot(evolutionNL(i,1), evolutionNL(i,2), '.', 'LineWidth',2, 'Color','black');
%             pause( pause_time );
%         end
%         title("NON LINEAR CONTROL"); 
%         legend("start", "goal", "trajectory output with control","Location","northwest");
%     end


%% ************************************************************************
    %% INPUT-OUTPUT LINEARIZATION
    import control.trajectory_tracking.input_output_control.input_output_linearization;
    Xfl = [x0 y0 theta0];
    evolutionFL = zeros(samples, 3);
    for i = 1 : samples
        evolutionFL(i,:) = Xfl;
        new_state = input_output_linearization(Ts, Xfl, ...
                                               xstar(i), xdstar(i), ...
                                               ystar(i), ydstar(i));
        
        if or((new_state(1)-goal(1))>0.03, (new_state(2)-goal(2))>0.03) 
            break;
        else 
            endXfl = new_state;
        end
    end
    
%      % PLOT STATICO
%     subplot(1,3,3);
%     plot2D(environment);
%     hold on; plot(evolutionFL(:,1), evolutionFL(:,2));
%     title("INPUT-OUTPUT LINEARIZATION"); 
%     legend("start", "goal", "trajectory output with control","Location","northwest");
%     
%     % PLOT DINAMICO
%     if isequal(DYNAMIC_ON, 1)
%         figure(); plot2D(environment);
%         pause_time = 0.000001;
%         for i=1:length(evolutionFL)
%             hold on; plot(evolutionFL(i,1), evolutionFL(i,2), '.', 'LineWidth',2, 'Color','black');
%             pause( pause_time );
%         end
%         title("INPUT-OUTPUT LINEARIZATION"); 
%         legend("start", "goal", "trajectory output with control","Location","northwest");
%     end


%% ************************************************************************
    %% CONTROLS COMPARISON
%     figure(); plot2D(environment);
%     hold on; plot(evolutionAL(:,1), evolutionAL(:,2), "DisplayName",...
%                   "trajectory output with approximated linearization");
%     hold on; plot(evolutionNL(:,1), evolutionNL(:,2), "DisplayName",...
%                           "trajectory output with non linear control");
%     hold on; plot(evolutionFL(:,1), evolutionFL(:,2), "DisplayName",...
%                         "trajectory output with input-output control");
%     title("CONTROLS COMPARISON"); legend("Location","northwest");

    
%% ************************************************************************
%% POSTURE REGULATION
import control.posture_regulation.cartesian_regulation.cartesian_regulation;
import control.posture_regulation.complete_regulation.complete_regulation;
    
    t_simulazione = 7000;
    angle = (270/180)*pi;
    
    
    x0=evolutionAL(end,1); y0=evolutionAL(end,2); theta0=evolutionAL(end,3);
    X0 = [x0 ; y0 ; theta0];
    
    global goal
    xf=goal(1); yf=goal(2); thetaf=angle;
    Xf = [xf ; yf ; thetaf];
    
    
    cartesian_postureAL = @(X)(cartesian_regulation(X, Xf, Ts));
    complete_postureAL = @(X)(complete_regulation(X, Xf, Ts));
    
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
    import control.posture_regulation.plot_robot;
%     figure(); axis([0 100 0 100]); hold on; plot_robot(postureAL);
    
    
    x = evolutionAL(:,1);
    y = evolutionAL(:,2);
    theta = evolutionAL(:,3);
    
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
    postureAL
    import control.posture_regulation.plot_robot;
    figure(); axis([0 100 0 100]); hold on; plot_robot(postureAL);
    
    
    x = postureAL(:,1);
    y = postureAL(:,2);
    theta = postureAL(:,3);
    
    
%     figure(); hold on; grid on;
%     plot(x0, y0, "og", "LineWidth",2); plot(xf, yf, "or", "LineWidth",2);
%     for k = 1 : size(evolutionAL,1)
%         plot(x, y, "ob", "LineWidth",2);
%         hold on;
%     end
    
    
    
%     f=figure(); f.Position=[300 150 800 600]; subplot(3,2,1);
%     
%     % LINEAR CONTROL
%     cartesian_postureAL = cartesian_regulation(evolutionAL(end,:), goal(1), goal(2), Ts, angle);
%     plot(cartesian_postureAL(1),cartesian_postureAL(2), ">", "Color","black");
%     title("LINEAR CONTROL CARTESIAN POSTURE");
%     complete_postureAL = complete_regulation(evolutionAL(end,:), goal(1), goal(2), angle, Ts, angle);
%     subplot(3,2,2);
%     plot(complete_postureAL(1),complete_postureAL(2), ">", "Color","black");
%     title("LINEAR CONTROL COMPLETE POSTURE");
%     
%     % NON LINEARIZATION
%     subplot(3,2,3);
%     cartesian_postureNL = cartesian_regulation(evolutionNL(end,:), goal(1), goal(2), Ts);
%     plot(cartesian_postureNL(1),cartesian_postureNL(2), ">", "Color","black");
%     title("NON LINEAR CONTROL CARTESIAN POSTURE");
%     complete_postureNL = complete_regulation(evolutionNL(end,:), goal(1), goal(2), angle, Ts);
%     subplot(3,2,4);
%     plot(complete_postureNL(1),complete_postureNL(2), ">", "Color","black");
%     title("NON LINEAR CONTROL COMPLETE POSTURE");
%     
%     % INPUT-OUTPUT CONTROL
%     cartesian_postureFL = cartesian_regulation(evolutionFL(end,:), goal(1), goal(2), Ts);
%     subplot(3,2,5); 
%     plot(cartesian_postureFL(1),cartesian_postureFL(2), ">", "Color","black");
%     title("INPUT OUTPUT CARTESIAN POSTURE");
%     complete_postureFL = complete_regulation(evolutionFL(end,:), goal(1), goal(2), angle, Ts);
%     subplot(3,2,6);
%     plot(complete_postureFL(1),complete_postureFL(2), ">", "Color","black");
%     title("INPUT OUTPUT CONTROL COMPLETE POSTURE");
%     
%     
    
end