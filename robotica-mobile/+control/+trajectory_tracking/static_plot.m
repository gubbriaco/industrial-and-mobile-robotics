function static_plot(environment, evolutionAL, evolutionNL, evolutionFL, title_plot, P)

    f=figure(); f.Position=[25 342 1500 420]; 
    
    subplot(1,3,1);
    plot2D(environment);
    hold on; plot(P(:,1),P(:,2));
    hold on; plot(evolutionAL(:,1), evolutionAL(:,2));
    title("CONTROL BASED ON APPROXIMATE LINEARIZATION"); 
    legend("start", "goal", "trajectory output without control",  "trajectory output with control",...
           "Location","northwest");
    
    subplot(1,3,2);
    plot2D(environment);
    hold on; plot(P(:,1),P(:,2));
    hold on; plot(evolutionNL(:,1), evolutionNL(:,2));
    title("NON LINEAR CONTROL"); 
    legend("start", "goal", "trajectory output without control", "trajectory output with control",...
           "Location","northwest");

    subplot(1,3,3);
    plot2D(environment);
    hold on; plot(P(:,1),P(:,2));
    hold on; plot(evolutionFL(:,1), evolutionFL(:,2));
    title("INPUT-OUTPUT LINEARIZATION"); 
    legend("start", "goal", "trajectory output without control",  "trajectory output with control",...
           "Location","northwest");
    
    sgtitle(title_plot + " TRAJECTORY TRACKING");
    
    
end