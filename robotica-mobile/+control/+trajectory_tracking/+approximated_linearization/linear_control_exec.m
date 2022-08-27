function evolution = linear_control_exec(Ts, samples, X0, xstar, ystar, xdstar, ydstar, ...
                                      xddstar, yddstar, thetastar)
                                  
   
                                  
    global start goal
    
    import control.trajectory_tracking.approximated_linearization.approximated_linearization;
    Xal = X0;
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
    
    evolution = evolutionAL;
    
end