function [vxc,vyc] = voronoi_map_cleanup(vx, vy, nr_obstacles, obstacles)

    for i=length(vx): -1 : 1
        x_line = vx(:,i);
        y_line = vy(:,i);
        
        for j=1:nr_obstacles
            xobst = [obstacles(j,1) obstacles(j,2)];
            yobst = [obstacles(j,3) obstacles(j,4)];
            
            import path_planning.voronoi_diagrams.obstacle_intersect;
            if obstacle_intersect(x_line, y_line, xobst, yobst)
                vx(:,i) = [];
                vy(:,i) = [];
                break;
            end
        end
    end

    vxc = vx;
    vyc = vy;
end