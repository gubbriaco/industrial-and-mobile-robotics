function trajectory = discrete_potential_fields(start, goal, width, height, grid, obstacles)

    %mappa dei potenziali
    import path_planning.discrete_potential_fields.distances;
    discrete_potential_map = distances(goal(1),goal(2), grid);

    %percorso minimo
    import path_planning.discrete_potential_fields.search_path;
    [trajectory, dpf_map] = search_path(start(1),start(2), discrete_potential_map);

    
    figure(); surface(dpf_map); title("DISCRETE POTENTIAL FIELDS MAP");
    
    
end