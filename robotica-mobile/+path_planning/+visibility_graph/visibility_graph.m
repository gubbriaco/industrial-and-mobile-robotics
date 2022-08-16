function [trajectory] = visibilitygraph(start,goal,obstacles)
    vertices_map = {};
    j=1;
    nr_walls=4;
    for i = (nr_walls+1) : size(obstacles)
        vertices_map{j} = [ [obstacles(i,1),obstacles(i,4)]; ...
                            [obstacles(i,1),obstacles(i,3)]; ...
                            [obstacles(i,2),obstacles(i,3)]; ...
                            [obstacles(i,2),obstacles(i,4)] ];
        j=j+1;
    end
    vertices_map = vertices_map.';

    import path_planning.visibility_graph.graph_creation;
    [path, distanza] = graph_creation(start, goal, vertices_map, vertices_map, obstacles);
    
    trajectory = path;
end