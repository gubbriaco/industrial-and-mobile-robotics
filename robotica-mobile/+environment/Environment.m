classdef Environment
   
    properties
        width {mustBeFinite, mustBeNonnegative}
        height {mustBeFinite, mustBeNonnegative}
        start
        goal
    end
    
    
    methods  
        %% CONSTRUCTOR
        function environment = Environment(width, height, start, goal)
            environment.width = width;
            environment.height = height;
            environment.start = start;
            environment.goal = goal;
        end
    end
    
    
    methods
        
        %% GETTERS
        function s = get_start(environment)
            s = environment.start;
        end
        
        function g = get_goal(environment)
            g = environment.goal;
        end
        
        %% INIZIALIZE ENVIRONMENT
        function inizialize(environment)
            global x_origin y_origin nr_points grid X Y;
            grid = zeros(environment.width, environment.height);
            nr_points=100;
            width_points=linspace(x_origin-1, nr_points, environment.width);
            height_points=linspace(y_origin-1, nr_points, environment.height);
            [X,Y] = meshgrid(width_points,height_points);
        end
        
        %% ADD WALLS
        function add_walls(environment)
            global grid nr_obstacles obstacles X Y;
            edge_height = 1;
            
            % over edge
            nr_obstacles=nr_obstacles+1;
            grid(1:2,1:environment.width) = edge_height;        
            obstacles(nr_obstacles,:) = [X(1,1) X(1,environment.width) Y(1) Y(2)];
            nr_obstacles=nr_obstacles+1;
            % under edge
            grid(environment.width-1:environment.width,1:environment.width) = edge_height;     
            obstacles(nr_obstacles,:) = [X(1,1) X(1,environment.width) Y(environment.width-1) Y(environment.width)];
            nr_obstacles=nr_obstacles+1;
            % left edge
            grid(1:environment.width,1:2) = edge_height;        
            obstacles(nr_obstacles,:) = [X(1,1) X(1,2) Y(1) Y(environment.width)];
            nr_obstacles=nr_obstacles+1;
            % right edge
            grid(1:environment.width,environment.width-1:environment.width) = edge_height;     
            obstacles(nr_obstacles,:) = [X(1,environment.width-1) X(1,environment.width) Y(1) Y(environment.width)];
            nr_obstacles=nr_obstacles+1;
            
        end
        
        %% ADD OBSTACLES
        function add_obstacles(environment)
            global nr_obstacles obstacles grid X Y;
            obstacle_height = 1;
            
            % obstacles nr.1
            x_left=15; x_right=25; 
            y_under=10; y_over=20;
            grid(y_under:y_over,x_left:x_right) = obstacle_height;
            nr_obstacles = nr_obstacles+1;
            obstacles(nr_obstacles,:) = [X(1,y_under) X(1,y_over) Y(x_left) Y(x_right)];
            
            % obstacles nr.2
            x_left=40; x_right=45;
            y_under=15; y_over=70;
            grid(y_under:y_over,x_left:x_right) = obstacle_height;
            nr_obstacles = nr_obstacles+1;
            obstacles(nr_obstacles,:) = [X(1,y_under) X(1,y_over) Y(x_left) Y(x_right)];
            
            % obstacles nr.3
            x_left=15; x_right=35; 
            y_under=30; y_over=60;
            grid(y_under:y_over,x_left:x_right) = obstacle_height;
            nr_obstacles = nr_obstacles+1;
            obstacles(nr_obstacles,:) = [X(1,y_under) X(1,y_over) Y(x_left) Y(x_right)];

            % obstacles nr.4
            x_left=60; x_right=90; 
            y_under=15; y_over=60;
            grid(y_under:y_over,x_left:x_right) = obstacle_height;
            nr_obstacles = nr_obstacles+1;
            obstacles(nr_obstacles,:) = [X(1,y_under) X(1,y_over) Y(x_left) Y(x_right)];

            % obstacles nr.5
            x_left=15; x_right=60;
            y_under=80; y_over=90;
            grid(y_under:y_over,x_left:x_right) = obstacle_height;
            nr_obstacles = nr_obstacles+1;
            obstacles(nr_obstacles,:) = [X(1,y_under) X(1,y_over) Y(x_left) Y(x_right)];

            % obstacles nr.6
            x_left=70; x_right=90;
            y_under=70; y_over=90;
            grid(y_under:y_over,x_left:x_right) = obstacle_height;
            nr_obstacles = nr_obstacles+1;
            obstacles(nr_obstacles,:) = [X(1,y_under) X(1,y_over) Y(x_left) Y(x_right)];
        end
       
        %% PLOT ENVIRONMENT
        function plot(environment)
            global X Y grid;
            Z = 1.*grid; 
            figure(); mesh(X,Y,Z); xlabel("X"); ylabel("Y"); zlabel("Z");
            axis("equal"), axis([0 100 0 100])
        end
        
    end
    
end

