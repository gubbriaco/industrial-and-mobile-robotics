classdef Environment
   % - width e' la larghezza dell'ambiente
   % - heigth e' l'altezza dell'ambiente
   
    properties
        width {mustBeFinite, mustBeNonnegative}
        height {mustBeFinite, mustBeNonnegative}
        start
        goal
        obstacles
        nr_obstacles
    end
    
    
    methods  
        function environment = Environment(width, height, start, goal)
            environment.width = width;
            environment.height = height;
            environment.start = start;
            environment.goal = goal;
            environment.obstacles = [];
            environment.nr_obstacles=0;
        end
    end
    
    
    methods
        
        function s = get_start(environment)
            s = environment.start;
        end
        
        function g = get_goal(environment)
            g = environment.goal;
        end
        
        
        function inizialize(environment)
            global x_origin y_origin grid X Y;
            grid = zeros(environment.width, environment.height);
            nr_points=100;
            width_points=linspace(x_origin-1, environment.width, nr_points);
            height_points=linspace(y_origin-1, environment.height, nr_points);
            [X,Y] = meshgrid(height_points,width_points);
        end
        
        function add_walls(environment)
            global x_origin y_origin grid;
            edge_width = 1;
            
            % left Y
            row_edge_origin=x_origin; column_edge_origin=y_origin; edge_h=environment.height;
            x_edge = [row_edge_origin edge_h]; y_edge = [column_edge_origin column_edge_origin];
            grid(x_edge(1):x_edge(2), y_edge(1):y_edge(2))=5;
            environment.nr_obstacles = environment.nr_obstacles+1;
            environment.obstacles(:,environment.nr_obstacles) = [row_edge_origin column_edge_origin edge_width edge_h];
            %obstacles(:,nr_obstacles) = [X(x_edge(1),x_edge(1)) X(x_edge(1),x_edge(2)) Y(y_edge(1)) Y(y_edge(1))];
            
            % right y
            row_edge_origin=x_origin; column_edge_origin=environment.width; edge_h=environment.height;
            x_edge = [row_edge_origin environment.height]; y_edge = [column_edge_origin column_edge_origin];
            grid(x_edge(1):x_edge(2), y_edge(1):y_edge(2))=5;
            environment.nr_obstacles = environment.nr_obstacles+1;
            environment.obstacles(:,environment.nr_obstacles) = [row_edge_origin column_edge_origin edge_width edge_h];
            %obstacles(:,nr_obstacles) = [X(x_edge(1),x_edge(1)) X(x_edge(1),x_edge(2)) Y(y_edge(1)) Y(y_edge(1))];
            
            % under
            row_edge_origin=x_origin; column_edge_origin=y_origin; edge_h=environment.width; edge_w=edge_width;
            x_edge = [row_edge_origin edge_w]; y_edge = [column_edge_origin edge_h];
            grid(x_edge(1):x_edge(2), y_edge(1):y_edge(2))=5;
            environment.nr_obstacles = environment.nr_obstacles+1;
            environment.obstacles(:,environment.nr_obstacles) = [row_edge_origin column_edge_origin edge_w edge_h];
            
            % over
            row_edge_origin=environment.height; column_edge_origin=y_origin; edge_h=environment.width; edge_w=edge_width;
            x_edge = [row_edge_origin row_edge_origin]; y_edge = [column_edge_origin edge_h];
            grid(x_edge(1):x_edge(2), y_edge(1):y_edge(2))=5;
            environment.nr_obstacles = environment.nr_obstacles+1;
            environment.obstacles(:,environment.nr_obstacles) = [row_edge_origin column_edge_origin edge_w edge_h];

        end
        
        function add_obstacles(environment)
            global grid;
            % obstacles nr.1
            x_obstacle=10; y_obstacle=8; w_obstacle=25; h_obstacle=30;
            x_edge = [x_obstacle x_obstacle+h_obstacle]; y_edge = [y_obstacle y_obstacle+h_obstacle];
            grid(y_edge(1):y_edge(2), x_edge(1):x_edge(2))=15;
            environment.nr_obstacles = environment.nr_obstacles+1;
            environment.obstacles(:,environment.nr_obstacles) = [x_obstacle y_obstacle w_obstacle h_obstacle];
            
            % obstacles nr.2
            x_obstacle=45; y_obstacle=80; w_obstacle=40; h_obstacle=15;
            x_edge = [x_obstacle x_obstacle+w_obstacle]; y_edge = [y_obstacle y_obstacle+h_obstacle];
            grid(y_edge(1):y_edge(2), x_edge(1):x_edge(2))=15;
            environment.nr_obstacles = environment.nr_obstacles+1;
            environment.obstacles(:,environment.nr_obstacles) = [x_obstacle y_obstacle w_obstacle h_obstacle];
            
            % obstacles nr.3
            x_obstacle=50; y_obstacle=10; w_obstacle=15; h_obstacle=45;
            x_edge = [x_obstacle x_obstacle+w_obstacle]; y_edge = [y_obstacle y_obstacle+h_obstacle];
            grid(y_edge(1):y_edge(2), x_edge(1):x_edge(2))=15;
            environment.nr_obstacles = environment.nr_obstacles+1;
            environment.obstacles(:,environment.nr_obstacles) = [x_obstacle y_obstacle w_obstacle h_obstacle];
            
            % obstacles nr.4
            x_obstacle=45; y_obstacle=60; w_obstacle=25; h_obstacle=15;
            x_edge = [x_obstacle x_obstacle+w_obstacle]; y_edge = [y_obstacle y_obstacle+h_obstacle];
            grid(y_edge(1):y_edge(2), x_edge(1):x_edge(2))=15;
            environment.nr_obstacles = environment.nr_obstacles+1;
            environment.obstacles(:,environment.nr_obstacles) = [x_obstacle y_obstacle w_obstacle h_obstacle];
            
            % obstacles nr.5
            x_obstacle=80; y_obstacle=6; w_obstacle=15; h_obstacle=60;
            x_edge = [x_obstacle x_obstacle+w_obstacle]; y_edge = [y_obstacle y_obstacle+h_obstacle];
            grid(y_edge(1):y_edge(2), x_edge(1):x_edge(2))=15;
            environment.nr_obstacles = environment.nr_obstacles+1;
            environment.obstacles(:,environment.nr_obstacles) = [x_obstacle y_obstacle w_obstacle h_obstacle];
            
            % obstacles nr.6
            x_obstacle=7; y_obstacle=45; w_obstacle=30; h_obstacle=50;
            x_edge = [x_obstacle x_obstacle+w_obstacle]; y_edge = [y_obstacle y_obstacle+h_obstacle];
            grid(y_edge(1):y_edge(2), x_edge(1):x_edge(2))=15;
            environment.nr_obstacles = environment.nr_obstacles+1;
            environment.obstacles(:,environment.nr_obstacles) = [x_obstacle y_obstacle w_obstacle h_obstacle];
        end
       
        function plot(environment)
            global X Y grid;
            % grid(start(1),start(2))=15;
            % grid(goal(1),goal(2))=15;
            Z = 1.*grid; 
            figure();
            mesh(X,Y,Z); xlabel("X"); ylabel("Y"); zlabel("Z");
        end
        
    end
    
end

