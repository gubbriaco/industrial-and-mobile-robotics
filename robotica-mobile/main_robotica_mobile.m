clear; close all; clc;
import robot.Robot;
import environment.Environment;
import environment.Obstacle;


%% ROBOT
global radius_robot
radius_robot = 1;
robot = Robot(radius_robot);
% PLOT ROBOT
figure(); plot(robot);

%% ENVIRONMENT
global width height start goal grid
x_origin=1; y_origin=1;
% offset per accedere al primo elemento della griglia essendo che in MATLAB
% gli elementi in una matrice vengono indicizzati a partire da 1 e non da 0
offset_grid=1;
width=275; height=125;
start = [x_origin+1 y_origin+1];
goal = [width-1 height-1];

%% GRID ENVIRONMENT
grid = zeros(height, width);
nr_points=height;
width_points=linspace(x_origin, width, height);
nr_points=width;
height_points=linspace(y_origin, height, width);
[X,Y] = meshgrid(height_points, width_points);

nr_obstacles = 0;

%% WALLS
edge_width = 1;

% left Y
row_edge_origin=x_origin; column_edge_origin=y_origin; edge_h=height;
x_edge = [row_edge_origin edge_h]; y_edge = [column_edge_origin column_edge_origin];
grid(x_edge(1):x_edge(2), y_edge(1):y_edge(2))=1; 
nr_obstacles = nr_obstacles+1;
obstacles(:,nr_obstacles) = [row_edge_origin column_edge_origin edge_width edge_h];
%obstacles(:,nr_obstacles) = [X(x_edge(1),x_edge(1)) X(x_edge(1),x_edge(2)) Y(y_edge(1)) Y(y_edge(1))];

% right y
row_edge_origin=x_origin; column_edge_origin=width; edge_h=height;
x_edge = [row_edge_origin height]; y_edge = [column_edge_origin column_edge_origin];
grid(x_edge(1):x_edge(2), y_edge(1):y_edge(2))=1; 
nr_obstacles = nr_obstacles+1;
obstacles(:,nr_obstacles) = [row_edge_origin column_edge_origin edge_width edge_h];
%obstacles(:,nr_obstacles) = [X(x_edge(1),x_edge(1)) X(x_edge(1),x_edge(2)) Y(y_edge(1)) Y(y_edge(1))];

% over
row_edge_origin=x_origin; column_edge_origin=y_origin; edge_h=width; edge_w=edge_width;
x_edge = [row_edge_origin edge_w]; y_edge = [column_edge_origin edge_h];
grid(x_edge(1):x_edge(2), y_edge(1):y_edge(2))=1; 
nr_obstacles = nr_obstacles+1;
obstacles(:,nr_obstacles) = [row_edge_origin column_edge_origin edge_w edge_h];

% under
row_edge_origin=height; column_edge_origin=y_origin; edge_h=width; edge_w=edge_width;
x_edge = [row_edge_origin row_edge_origin]; y_edge = [column_edge_origin edge_h];
grid(x_edge(1):x_edge(2), y_edge(1):y_edge(2))=1; 
nr_obstacles = nr_obstacles+1;
obstacles(:,nr_obstacles) = [row_edge_origin column_edge_origin edge_w edge_h];


%% OBSTACLES

% obstacles nr.1


%% PLOT ENVIRONMENT
%% Plot
Z = 1.*grid; 
figure();
s = mesh(X,Y,Z);




% environment = Environment(width, height);
% % PLOT ENVIRONMENT
% figure(); plot(environment, "ENVIRONMENT");
% 
% nr_obstacles=6;
% 
% % OBSTACLE NR.1
% x_obstacle=20; y_obstacle=100; w_obstacle=20; h_obstacle=15; curvature=0.2;
% obstacle = Obstacle(x_obstacle, y_obstacle, w_obstacle, h_obstacle, curvature);
% obstacles(1) = obstacle;
% add_obstacle(environment, obstacle);
% plot(obstacle, "red");
% 
% % OBSTACLE NR.2
% x_obstacle=45; y_obstacle=20; w_obstacle=55; h_obstacle=35; curvature=0.7;
% obstacle = Obstacle(x_obstacle, y_obstacle, w_obstacle, h_obstacle, curvature);
% obstacles(2) = obstacle;
% add_obstacle(environment, obstacle);
% plot(obstacle, "red");
% 
% % OBSTACLE NR.3
% x_obstacle=65; y_obstacle=80; w_obstacle=40; h_obstacle=30; curvature=0.9;
% obstacle = Obstacle(x_obstacle, y_obstacle, w_obstacle, h_obstacle, curvature);
% obstacles(3) = obstacle;
% add_obstacle(environment, obstacle);
% plot(obstacle, "red");
% 
% % OBSTACLE NR.4
% x_obstacle=120; y_obstacle=60; w_obstacle=30; h_obstacle=55; curvature=0.3;
% obstacle = Obstacle(x_obstacle, y_obstacle, w_obstacle, h_obstacle, curvature);
% obstacles(4) = obstacle;
% add_obstacle(environment, obstacle);
% plot(obstacle, "red");
% 
% % OBSTACLE NR.5
% x_obstacle=170; y_obstacle=65; w_obstacle=50; h_obstacle=30; curvature=0.1;
% obstacle = Obstacle(x_obstacle, y_obstacle, w_obstacle, h_obstacle, curvature);
% obstacles(5) = obstacle;
% add_obstacle(environment, obstacle);
% plot(obstacle, "red");
% 
% % OBSTACLE NR.6
% x_obstacle=180; y_obstacle=10; w_obstacle=70; h_obstacle=30; curvature=0.5;
% obstacle = Obstacle(x_obstacle, y_obstacle, w_obstacle, h_obstacle, curvature);
% obstacles(6) = obstacle;
% add_obstacle(environment, obstacle);
% plot(obstacle, "red");
% 
% %% OBSTACLES SHAPE
% base_enlargement = radius_robot;
% security_offset = eps;
% enlargement = base_enlargement+security_offset;
% path_planning.obstacles_shape.enlarge_obstacles
% figure(); plot(environment, "ENVIRONMENT WITH ENLARGED OBSTACLES");
% for i=1:length(obstacles)
%     plot(enlarged_obstacles(i), "#808080")
%     plot(obstacles(i), "red")
% end
% 