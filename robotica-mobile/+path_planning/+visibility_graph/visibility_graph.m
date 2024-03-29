function [trajectory] = visibility_graph()

    vertices_map = {};
    
    global width height start goal obstacles radius_robot
    vertices_walls = zeros(4,2);
    vertices_walls(1,:) = [width-2*radius_robot,height-2*radius_robot]; % angolo alto dx
    vertices_walls(2,:) = [2*radius_robot,height-2*radius_robot]; % angolo alto sx
    vertices_walls(3,:) = [2*radius_robot,2*radius_robot]; % angolo basso sx
    vertices_walls(4,:) = [width-2*radius_robot,2*radius_robot]; % angolo basso dx
    
    vertices_map = {vertices_walls};
    
    
    j=2;
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
    [path, distanza] = graph_creation(start, goal, vertices_map, ...
                                      vertices_map);
    
    trajectory = path;
    
    
end