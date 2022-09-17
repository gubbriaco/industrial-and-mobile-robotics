function trajectory_tracking_plot(DYNAMIC_ON, ...
                                  environment, evolutionAL, evolutionNL, evolutionFL, ...
                                  title_plot, P)

    import control.trajectory_tracking.static_plot;
    import control.trajectory_tracking.dynamic_plot;
    import control.trajectory_tracking.comparison_trajectory;
    import control.trajectory_tracking.comparison_xy;
    static_plot(environment, evolutionAL, evolutionNL, evolutionFL, title_plot, P);
    hold off;
    
    if isequal(DYNAMIC_ON, 0)
        comparison_trajectory(environment, evolutionAL, evolutionNL, evolutionFL, title_plot);
        comparison_xy(P, evolutionAL, evolutionNL, evolutionFL, title_plot);
    end
    
end