function evolution = input_output_control_exec(Ts, samples, X0, xstar, ystar, xdstar, ydstar, ...
                                            xddstar, yddstar, thetastar)
         
    global start goal
    
    import control.trajectory_tracking.input_output_control.input_output_linearization;
    Xfl = X0;
    evolutionFL = [];
    for i = 1 : samples
        evolutionFL(i,:) = Xfl;
        new_state = input_output_linearization(Ts, Xfl, ...
                                               xstar(i), xdstar(i), ...
                                               ystar(i), ydstar(i));
        
        if or((new_state(1)-goal(1))>0.03, (new_state(2)-goal(2))>0.03) 
            break;
        else 
            Xfl = new_state;
        end
    end
    
    evolution = evolutionFL;
    
end