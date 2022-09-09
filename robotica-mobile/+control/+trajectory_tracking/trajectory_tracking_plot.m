function trajectory_tracking_plot(DYNAMIC_ON, ...
                                  environment, evolutionAL, evolutionNL, evolutionFL, ...
                                  title_plot)

    import control.trajectory_tracking.static_plot;
    import control.trajectory_tracking.dynamic_plot;
    import control.trajectory_tracking.comparison_plot;
    static_plot(environment, evolutionAL, evolutionNL, evolutionFL, title_plot);
    dynamic_plot(DYNAMIC_ON, environment, evolutionAL, evolutionNL, evolutionFL);
    comparison_plot(environment, evolutionAL, evolutionNL, evolutionFL);

end