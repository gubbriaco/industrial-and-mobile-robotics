function comparison_xy(P, evolutionAL, evolutionNL, evolutionFL, title_plot)

    global goal
    
    f=figure(); f.Position=[25 100 1500 600];
    
    subplot(2,3,1); 
    p=plot(evolutionAL(:,1)); hold on; plot(p.XData(end),goal(1), "*", "Color","green");
    title("L CONTROL x-TREND"); 
    legend("x-trend","x-goal", "Location","northwest"); xlabel("t"); ylabel("x");
    subplot(2,3,4); 
    p=plot(evolutionAL(:,2)); hold on; plot(p.XData(end),goal(2), "*", "Color","green");
    title("L CONTROL y-TREND"); 
    legend("y-trend","y-goal", "Location","northwest");xlabel("t"); ylabel("y");
    
    subplot(2,3,2); 
    p=plot(evolutionNL(:,1)); hold on; plot(p.XData(end),goal(1), "*", "Color","green");
    title("NON-L CONTROL x-TREND"); 
    legend("x-trend","x-goal", "Location","northwest"); xlabel("t"); ylabel("x");
    subplot(2,3,5); 
    p=plot(evolutionNL(:,2)); hold on; plot(p.XData(end),goal(2), "*", "Color","green");
    title("NON-L CONTROL y-TREND"); 
    legend("y-trend","y-goal", "Location","northwest"); xlabel("t"); ylabel("y");

    subplot(2,3,3); 
    p=plot(evolutionFL(:,1)); hold on; plot(p.XData(end),goal(1), "*", "Color","green");
    title("I/O CONTROL x-TREND"); 
    legend("x-trend","x-goal", "Location","northwest"); xlabel("t"); ylabel("x");
    subplot(2,3,6); 
    p=plot(evolutionFL(:,2)); hold on; plot(p.XData(end),goal(2), "*", "Color","green");
    title("I/O CONTROL y-TREND"); 
    legend("y-trend","y-goal", "Location","northwest"); xlabel("t"); ylabel("y");
     
    sgtitle(title_plot + " xy - TREND")
    
    
end