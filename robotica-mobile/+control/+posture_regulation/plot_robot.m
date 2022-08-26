function plot_robot(evolution)
    import control.posture_regulation.plot_triangle;
    global start goal
    plot(start(1), start(2), "*", "Color","blue");
    plot(goal(1), goal(2), "*", "Color","green");
    for i = 1 : size(evolution) - 1
        plot(evolution(i,1), evolution(i,2),"or");
        triangle = plot_triangle([evolution(i,1),evolution(i,2)], evolution(i,3));
        pause(0.0001);
        delete(triangle);
    end
    
    
end