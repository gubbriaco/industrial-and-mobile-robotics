function plot_robot(evolution)

    
    global start goal environment
    import environment.Environment;
    plot2D(environment);
    iteration=0;
    max_iterations=50;
    for i = 1 : size(evolution) - 1
        if and(isequal(round(evolution(i,1)),goal(1)), isequal(round(evolution(i,2)),goal(2)))
            iteration=iteration+1;
        end
        
        plot(evolution(i,1), evolution(i,2), "or", "MarkerSize", 3);
        import control.posture_regulation.plot_triangle;
        triangle = plot_triangle([evolution(i,1),evolution(i,2)], evolution(i,3));
        pause(0.0001);
        
        if isequal(iteration, max_iterations)
            return
        end
        
        delete(triangle);
        
    end
    
    
end