function trajectory = discrete_potential_fields(start, goal, width, height, grid, obstacles)

    %mappa dei potenziali
    import path_planning.discrete_potential_fields.distances;
    discrete_potential_map = distances(goal(1),goal(2), grid);

    %percorso minimo
    import path_planning.discrete_potential_fields.search_path;
    [trajectory, dpf_map] = search_path(start(1),start(2), discrete_potential_map);
%     figure();
%     %surface(path_map);
%     plot(trajectory(:,1), trajectory(:,2));
%     hold on;
%     for j = 1 : size(obstacles)
%         ob = obstacles(j,:);
%         x_ob = ob(1);
%         y_ob = ob(3);
%         w_ob = ob(2)-ob(1);
%         h_ob = ob(4)-ob(3);
%         rectangle("position",[x_ob y_ob w_ob h_ob], "facecolor","r");
%     end
%     hold on; plot(start(1), start(2), "*", "Color","#124ee6");
%     hold on; plot(goal(1)+1, goal(2)+1, "*", "Color","#0eb04f");
%     title("DISCRETE POTENTIAL FIELDS WITH ASSOCIATED SHORTEST PATH");


end