function complete_regulation_exec(DYNAMIC_ON, t_simulazione, X0, evolution, complete_posture,...
                              nr_subplot, nc_subplot, subplot_index, title_evolution)
    
    global start goal

    posture(1,:) = X0;
    Xdot = complete_posture(X0);
    
    for k = 2 : t_simulazione
        X = Xdot;
        Xdot = complete_posture(X);
        
        posture(k,1) = Xdot(1);
        posture(k,2) = Xdot(2);
        % utilizzo la funzione enroll_theta affinche' l'angolo rimanga
        % nell'intervallo [-pi, pi]
        import control.posture_regulation.enroll_theta;
        posture(k,3) = enroll_theta(Xdot(3));
    end
    
    posture = [evolution ; posture];
    
    if isequal(DYNAMIC_ON, 0)
        subplot(nr_subplot, nc_subplot, subplot_index); 
        axis([0 100 0 100]); hold on; 
        global environment
        import environment.Environment;
        plot2D(environment);
        plot(posture(:,1), posture(:,2), "or", "MarkerSize",1.85);
        import control.posture_regulation.plot_triangle;
        plot_triangle([posture(end,1),posture(end,2)], posture(end,3));
        title(title_evolution + " COMPLETE REGULATION");
    end
    
    if isequal(DYNAMIC_ON, 1)
        figure(); axis([0 100 0 100]); hold on; 
        import control.posture_regulation.plot_robot;
        plot_robot(posture);
    end
    
    

end