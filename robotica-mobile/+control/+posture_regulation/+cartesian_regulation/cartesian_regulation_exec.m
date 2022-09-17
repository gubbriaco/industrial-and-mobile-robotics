function cartesian_regulation_exec(DYNAMIC_ON, t_simulazione, X0, evolution, cartesian_posture,...
                                   nr_subplot, nc_subplot, subplot_index, title_evolution, angle)

    global start goal
    
    posture(1,:) = X0;
    Xdot = cartesian_posture(X0);
    
    for k = 2 : t_simulazione
        X = Xdot;
        Xdot = cartesian_posture(X);
        if isequal(round(Xdot(1)),goal(1)) && isequal(round(Xdot(2)),goal(2)) || isequal(round(180+(Xdot(3)*180)/pi),round((angle*180)/pi))
            break;
        end
        posture(k,1) = Xdot(1);
        posture(k,2) = Xdot(2);
        % utilizzo la funzione enroll_theta affinche' l'angolo rimanga
        % nell'intervallo [-pi, pi]
        import control.posture_regulation.enroll_theta;
        posture(k,3) = enroll_theta(Xdot(3));
    end
    
    Xdot(3)=180+abs((Xdot(3)*180)/pi);
    while Xdot(3) > 360
        Xdot(3) = Xdot(3)-360;
    end
    
    Xdot(1)=round(Xdot(1)); Xdot(2)=round(Xdot(2)); Xdot(3)=round(Xdot(3));
    angle=(angle*180)/pi;
    soglia = 1;
    if abs(Xdot(1)-goal(1)) <= soglia
        Xdot(1)=goal(1);
    else
        error("Coordinata x non raggiunta nella cartesian regulation.");
    end
    if abs(Xdot(2)-goal(2)) <= soglia
        Xdot(2)=goal(2);
    else
        error("Coordinata y non raggiunta nella cartesian regulation.");
    end
    if abs(Xdot(3)-angle) <= soglia
        Xdot(3)=angle;
    end
    
    disp(" ");
    disp(title_evolution + " cartesian regulation: ");
    Xdot'
    disp(" ");
    
    posture = [evolution ; posture];
   
    global width height environment
    if isequal(DYNAMIC_ON, 0)
        subplot(nr_subplot,nc_subplot,subplot_index); axis([0 width 0 height]); hold on; 
        import environment.Environment;
        plot2D(environment);
        plot(posture(:,1), posture(:,2), "or", "MarkerSize",1.85);
        import control.posture_regulation.plot_triangle;
        plot_triangle([posture(end,1),posture(end,2)], posture(end,3));
        title(title_evolution + " CARTESIAN REGULATION");
    end
    
    if isequal(DYNAMIC_ON, 1)
        figure(); axis([0 100 0 100]); hold on; 
        import control.posture_regulation.plot_robot;
        plot_robot(posture);
    end
    

end