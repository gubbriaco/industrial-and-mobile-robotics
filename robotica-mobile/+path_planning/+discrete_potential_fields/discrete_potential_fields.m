%clc; clear; 
function discrete_potential_fields(start, goal, width, height, grid)

    %mappa dei potenziali
    import path_planning.discrete_potential_fields.distances;
    discrete_potential_map = distances(goal(1),goal(2), grid);

    %percorso minimo
    import path_planning.discrete_potential_fields.search_path;
    [cell_path, path_map] = search_path(start(1),start(2), discrete_potential_map);
    figure(); title("PATH MAP");
    surface(path_map);
    hold on; plot(start(1), start(2), "*", "LineWidth",4, "Color","#124ee6");
    hold on; plot(goal(1)+1, goal(2)+1, "*", "LineWidth", 4, "Color","#0eb04f");

    figure(); title("CELL PATH");
    %size_cell_path=size(cell_path);
    plot(cell_path(:,1), cell_path(:,2)); xlim([1 width]); ylim([1 height]);
    hold on; plot(start(1), start(2), "*", "LineWidth",4, "Color","#124ee6");
    hold on; plot(goal(1)+1, goal(2)+1, "*", "LineWidth", 4, "Color","#0eb04f");

end