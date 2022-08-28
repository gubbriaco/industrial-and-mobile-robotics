classdef Environment
   
   properties
        width {mustBeFinite, mustBeNonnegative}
        height {mustBeFinite, mustBeNonnegative}
        nc {mustBeFinite, mustBeNonnegative}
        nr {mustBeFinite, mustBeNonnegative}
   end
   
   methods
       function environment=Environment(width, height, nc, nr)
            environment.width=width;
            environment.height=height;
            environment.nc=nc;
            environment.nr=nr;
       end
       
       function inizialize(environment)
           global grid X Y gridni Xni Yni
             % Genero una mappa di ostacoli che sistemo in una griglia binaria di occupazione
            % dello spazio. Di conseguenza per rappresentare gli ostacoli posso sfruttare una
            % meshgrid. 

            %% GRID ENVIRONMENT
            %nr = 100; nc = 100;
            x_origin=1; y_origin=1;
            %width=100; height=100;
            grid = zeros(environment.nr, environment.nc);
            width_points = linspace(x_origin-1, environment.nr, environment.width);
            height_points = linspace(y_origin-1, environment.nc, environment.height);
            [X,Y] = meshgrid(width_points, height_points);
            
            gridni = zeros(environment.nr, environment.nc);
            width_points = linspace(x_origin-1, environment.nr, environment.width);
            height_points = linspace(y_origin-1, environment.nc, environment.height);
            [Xni,Yni] = meshgrid(width_points, height_points);
       end
       
       function add_obstacles(environment, ob_value)
            global radius_robot X Y grid nr_obstacles obstacles nr_obstaclesni obstaclesni
            global Xni Yni gridni

            % nr_obstaclesni e obstaclesni sono rispettivamente il numero
            % degli ostacoli non ingrossati e il vettore che contiene le
            % coordinate e le grandezze degli ostacoli non ingrossati
            %% OBSTACLES
            nr_obstacles=0;
            nr_obstaclesni=0;

            %% WALLS
            width_wall = 1;
            height_wall = 1;

            % under wall
            x_origin_wall=1; y_origin_wall=1; length_wall=100;
            grid(1:2,1:100) = ob_value;
            nr_obstacles = nr_obstacles+1;
            obstacles(nr_obstacles,:) = [X(1,1) X(1,100) Y(1) Y(2)];

            % over wall
            grid(99:100,1:100) = ob_value; 
            nr_obstacles = nr_obstacles+1;
            obstacles(nr_obstacles,:) = [X(1,1) X(1,100) Y(99) Y(100)];

            % left wall
            grid(1:100,1:2) = ob_value; 
            nr_obstacles = nr_obstacles+1;
            obstacles(nr_obstacles,:) = [X(1,1) X(1,2) Y(1) Y(100)];

            % right wall
            grid(1:100,99:100) = ob_value; 
            nr_obstacles = nr_obstacles+1;
            obstacles(nr_obstacles,:) = [X(1,99) X(1,100) Y(1) Y(100)];


            %grid(y_under:y_over, x_under:x_over)
            height_obstacle = 1;

            % obstacle nr.1
            x_left=30; x_right=40; 
            y_under=10; y_over=20;
            grid(x_left:x_right,y_under:y_over) = ob_value;   
            nr_obstacles = nr_obstacles+1;
            obstacles(nr_obstacles,:) = [X(1,y_under) X(1,y_over) Y(x_left) Y(x_right)];
            
            x_left=x_left+radius_robot; x_right=x_right-radius_robot;
            y_under=y_under+radius_robot; y_over=y_over-radius_robot;
            gridni(x_left:x_right,y_under:y_over) = ob_value;
            nr_obstaclesni = nr_obstaclesni+1; 
            obstaclesni(nr_obstaclesni,:) = [Xni(1,y_under) Xni(1,y_over) Yni(x_left) Yni(x_right)];
            
            
            % obstacle nr.2
            x_left=40; x_right=45;
            y_under=40; y_over=70;
            grid(x_left:x_right,y_under:y_over) = ob_value;   
            nr_obstacles = nr_obstacles+1;
            obstacles(nr_obstacles,:) = [X(1,y_under) X(1,y_over) Y(x_left) Y(x_right)];
            
            x_left=x_left+radius_robot; x_right=x_right-radius_robot;
            y_under=y_under+radius_robot; y_over=y_over-radius_robot;
            gridni(x_left:x_right,y_under:y_over) = ob_value;
            nr_obstaclesni = nr_obstaclesni+1; 
            obstaclesni(nr_obstaclesni,:) = [Xni(1,y_under) Xni(1,y_over) Yni(x_left) Yni(x_right)];
            
            
            % obstacle nr.3
            x_left=15; x_right=35; 
            y_under=35; y_over=60;
            grid(x_left:x_right,y_under:y_over) = ob_value;
            nr_obstacles = nr_obstacles+1;
            obstacles(nr_obstacles,:) = [X(1,y_under) X(1,y_over) Y(x_left) Y(x_right)];
            
            x_left=x_left+radius_robot; x_right=x_right-radius_robot;
            y_under=y_under+radius_robot; y_over=y_over-radius_robot;
            gridni(x_left:x_right,y_under:y_over) = ob_value;
            nr_obstaclesni = nr_obstaclesni+1; 
            obstaclesni(nr_obstaclesni,:) = [Xni(1,y_under) Xni(1,y_over) Yni(x_left) Yni(x_right)];

            
            % obstacle nr.4
            x_left=70; x_right=90; 
            y_under=15; y_over=60;
            grid(x_left:x_right,15:60) = ob_value;      
            nr_obstacles = nr_obstacles+1;
            obstacles(nr_obstacles,:) = [X(1,y_under) X(1,y_over) Y(x_left) Y(x_right)];
            
            x_left=x_left+radius_robot; x_right=x_right-radius_robot;
            y_under=y_under+radius_robot; y_over=y_over-radius_robot;
            gridni(x_left:x_right,y_under:y_over) = ob_value;
            nr_obstaclesni = nr_obstaclesni+1; 
            obstaclesni(nr_obstaclesni,:) = [Xni(1,y_under) Xni(1,y_over) Yni(x_left) Yni(x_right)];

            
            % obstacle nr.5
            x_left=15; x_right=60;
            y_under=80; y_over=90;
            grid(x_left:x_right,y_under:y_over) = ob_value;   
            nr_obstacles = nr_obstacles+1;
            obstacles(nr_obstacles,:) = [X(1,y_under) X(1,y_over) Y(x_left) Y(x_right)];
            
            x_left=x_left+radius_robot; x_right=x_right-radius_robot;
            y_under=y_under+radius_robot; y_over=y_over-radius_robot;
            gridni(x_left:x_right,y_under:y_over) = ob_value;
            nr_obstaclesni = nr_obstaclesni+1; 
            obstaclesni(nr_obstaclesni,:) = [Xni(1,y_under) Xni(1,y_over) Yni(x_left) Yni(x_right)];

            
            % obstacle nr.6
            x_left=70; x_right=75;
            y_under=70; y_over=75;
            grid(x_left:x_right,y_under:y_over) = ob_value;
            nr_obstacles = nr_obstacles+1;
            obstacles(nr_obstacles,:) = [X(1,y_under) X(1,y_over) Y(x_left) Y(x_right)];
            
            x_left=x_left+radius_robot; x_right=x_right-radius_robot;
            y_under=y_under+radius_robot; y_over=y_over-radius_robot;
            gridni(x_left:x_right,y_under:y_over) = ob_value;
            nr_obstaclesni = nr_obstaclesni+1; 
            obstaclesni(nr_obstaclesni,:) = [Xni(1,y_under) Xni(1,y_over) Yni(x_left) Yni(x_right)];
            
       end
       
       function plot(environment)
           global X Y grid 
            %% PLOT
            Z = 1.*grid;
            mesh(X,Y,Z); xlabel("X"); ylabel("Y"); zlabel("Z");
            title("ENVIRONMENT"),axis("equal"), axis([0 environment.width 0 environment.height])
       end
       
       function plot2D(environment)
           global start goal obstacles obstaclesni
           hold on; plot(start(1),start(2), "*", "Color","b", "DisplayName","start");
           hold on; plot(goal(1),goal(2), "*", "Color","g", "DisplayName","goal");
           hold on;
           nr_walls=4;
           for i = 1 : nr_walls
               ob = obstacles(i,:);
               x_ob = ob(1);
               y_ob = ob(3);
               w_ob = ob(2)-ob(1);
               h_ob = ob(4)-ob(3);
               rectangle("position",[x_ob y_ob w_ob h_ob], "facecolor","red");
           end 
           for j = (nr_walls+1) : size(obstacles)
               ob = obstacles(j,:);
               x_ob = ob(1);
               y_ob = ob(3);
               w_ob = ob(2)-ob(1);
               h_ob = ob(4)-ob(3);
               rectangle("position",[x_ob y_ob w_ob h_ob], "facecolor","#f5c0ba");
           end
           for k = 1 : size(obstaclesni)
               obni = obstaclesni(k,:);
               x_obni = obni(1);
               y_obni = obni(3);
               w_obni = obni(2)-obni(1);
               h_obni = obni(4)-obni(3);
               rectangle("position",[x_obni y_obni w_obni h_obni], "facecolor","red");
           end
       end
   end
   
    
end

