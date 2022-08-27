function dynamic_plot(DYNAMIC_ON, environment, evolutionAL, evolutionNL, evolutionFL)

    if isequal(DYNAMIC_ON, 1)
        
        figure(); plot2D(environment);
        pause_time = 0.000001;
        for i=1:length(evolutionAL)
            hold on; plot(evolutionAL(i,1), evolutionAL(i,2), '.', 'LineWidth',2, 'Color','black');
            pause( pause_time );
        end
        title("CONTROL BASED ON APPROXIMATE LINEARIZATION");
        legend("start", "goal", "trajectory output with control","Location","northwest");
        
        figure(); plot2D(environment);
        pause_time = 0.000001;
        for i=1:length(evolutionNL)
            hold on; plot(evolutionNL(i,1), evolutionNL(i,2), '.', 'LineWidth',2, 'Color','black');
            pause( pause_time );
        end
        title("NON LINEAR CONTROL");
        legend("start", "goal", "trajectory output with control","Location","northwest");
        
        figure(); plot2D(environment);
        pause_time = 0.000001;
        for i=1:length(evolutionFL)
            hold on; plot(evolutionFL(i,1), evolutionFL(i,2), '.', 'LineWidth',2, 'Color','black');
            pause( pause_time );
        end
        title("INPUT-OUTPUT LINEARIZATION");
        legend("start", "goal", "trajectory output with control","Location","northwest");
        
    end
    
end