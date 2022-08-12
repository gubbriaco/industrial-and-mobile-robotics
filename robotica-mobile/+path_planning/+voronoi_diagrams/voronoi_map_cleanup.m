function [vxc,vyc] = voronoi_map_cleanup(vx, vy, nr_obstacles, obstacles)

    for i=length(vx):-1:1
        x_line = vx(:,i);
        y_line = vy(:,i);
        
        for j=1:nr_obstacles
            xi_obst = obstacles(1,j);
            yi_obst = obstacles(2,j);
            xf_obst = obstacles(3,j);
            yf_obst = obstacles(4,j);
            
            import path_planning.voronoi_diagrams.obstacle_intersect;
            if obstacle_intersect(x_line, y_line, xi_obst, yi_obst, xf_obst, yf_obst)
                vx(:,i) = [];
                vy(:,i) = [];
                break;
            end
        end
    end

    vxc = vx;
    vyc = vy;
end