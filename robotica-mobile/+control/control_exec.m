function control_exec(environment, P, Ts, samples)

    %% TRAJECTORY GENERATION
    import control.trajectory_tracking.trajectory_generation;
    [xstar, ystar, xdstar, ydstar, xddstar, yddstar, thetastar]...
                                           = trajectory_generation(P, samples);
    x0 = xstar(1)-0.1;
    y0 = ystar(1)+0.1;
    theta0 = thetastar(1)+deg2rad(0.1);
    
    
    %% CONTROL BASED ON APPROXIMATE LINEARIZATION
    import control.trajectory_tracking.approximated_linearization.approximated_linearization;
    Xal = [x0 y0 theta0];
    evolutionAL = zeros(samples, 3);
    for i = 1 : samples
        evolutionAL(i,:) = Xal;
        new_state = approximated_linearization(Ts, Xal, ...
                                               xstar(i), ystar(i), ...
                                               xdstar(i), ydstar(i),...
                                               xddstar(i), yddstar(i), ...
                                               thetastar(i));
        Xal = new_state;
    end
    
    % PLOT STATICO
    figure(); plot2D(environment);
    hold on; plot(evolutionAL(:,1), evolutionAL(:,2));
    title("CONTROL BASED ON APPROXIMATE LINEARIZATION"); 
    legend("start", "goal", "trajectory output with control","Location","northwest");
    
    %PLOT DINAMICO
%     figure(); plot2D(environment);
%     pause_time = 0.000001;
%     for i=1:length(evolutionAL)
%         hold on; plot(evolutionAL(i,1), evolutionAL(i,2), '.', 'LineWidth',2, 'Color','black');
%         pause( pause_time );
%     end
%     title("CONTROL BASED ON APPROXIMATE LINEARIZATION"); 
%     legend("start", "goal", "trajectory output with control","Location","northwest");


    
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
        Xnl = new_state;
    end
    
    % PLOT STATICO
    figure(); plot2D(environment);
    hold on; plot(evolutionNL(:,1), evolutionNL(:,2));
    title("NON LINEAR CONTROL"); 
    legend("start", "goal", "trajectory output with control","Location","northwest");
    
    % PLOT DINAMICO
%     figure(); plot2D(environment);
%     pause_time = 0.000001;
%     for i=1:length(evolutionNL)
%         hold on; plot(evolutionNL(i,1), evolutionNL(i,2), '.', 'LineWidth',2, 'Color','black');
%         pause( pause_time );
%     end
%     title("NON LINEAR CONTROL"); 
%     legend("start", "goal", "trajectory output with control","Location","northwest");



    %% INPUT-OUTPUT LINEARIZATION
    import control.trajectory_tracking.input_output_control.input_output_linearization;
    Xfl = [x0 y0 theta0];
    evolutionFL = zeros(samples, 3);
    for i = 1 : samples
        evolutionFL(i,:) = Xfl;
        new_state = input_output_linearization(Ts, Xfl, ...
                                               xstar(i), xdstar(i), ...
                                               ystar(i), ydstar(i));
        Xfl = new_state;
    end
    
     % PLOT STATICO
    figure(); plot2D(environment);
    hold on; plot(evolutionFL(:,1), evolutionFL(:,2));
    title("INPUT-OUTPUT LINEARIZATION"); 
    legend("start", "goal", "trajectory output with control","Location","northwest");
    
    % PLOT DINAMICO
%     figure(); plot2D(environment);
%     pause_time = 0.000001;
%     for i=1:length(evolutionFL)
%         hold on; plot(evolutionFL(i,1), evolutionFL(i,2), '.', 'LineWidth',2, 'Color','black');
%         pause( pause_time );
%     end
%     title("INPUT-OUTPUT LINEARIZATION"); 
%     legend("start", "goal", "trajectory output with control","Location","northwest");


    %% CONTROLS COMPARISON
    figure(); plot2D(environment);
    hold on; plot(evolutionAL(:,1), evolutionAL(:,2), "DisplayName",...
                  "trajectory output with approximated linearization");
    hold on; plot(evolutionNL(:,1), evolutionNL(:,2), "DisplayName",...
                          "trajectory output with non linear control");
    hold on; plot(evolutionFL(:,1), evolutionFL(:,2), "DisplayName",...
                        "trajectory output with input-output control");
    title("CONTROLS COMPARISON"); legend("Location","northwest");



end