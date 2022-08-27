function evolution = non_linear_control_exec(Ts, samples, X0, xstar, ystar, xdstar, ydstar, ...
                                          xddstar, yddstar, thetastar)       
                  
    global start goal
    
    import control.trajectory_tracking.non_linearization.non_linearization;
    Xnl = X0;
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

    evolution = evolutionNL;
    
end