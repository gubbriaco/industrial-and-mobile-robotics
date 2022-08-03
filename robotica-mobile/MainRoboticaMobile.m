clear; close all; clc;
import robot.Robot;
import environment.Environment;


%% ROBOT
global radius_robot
radius_robot = 5;
robot = Robot(radius_robot);
% PLOT ROBOT
figure(); plot(robot);

%% ENVIRONMENT
global width height
x_origin=0; y_origin=0;
width=275; height=125;
start = [x_origin+1 y_origin+1];
goal = [width-1 height-1];
matrix = zeros(height, width);
environment = Environment(width, height);

% PLOT ENVIRONMENT
figure(); plot(environment);

% add_obstacle(x_obstacle, y_obstacle, w_obstacle, h_obstacle, curvature)
nr_obstacles=6; nr_parameters=5;
obstacles = zeros(nr_obstacles, nr_parameters);

x_obstacle=20; y_obstacle=100; w_obstacle=20; h_obstacle=25; curvature=0.2;
obstacles(1,1)=x_obstacle; obstacles(1,2)=y_obstacle; 
obstacles(1,3)=w_obstacle; obstacles(1,4)=h_obstacle; obstacles(1,5)=curvature;
add_obstacle(environment, matrix, x_obstacle, y_obstacle, w_obstacle, h_obstacle);
plot_obstacle(environment, x_obstacle, y_obstacle, w_obstacle, h_obstacle, curvature)

x_obstacle=45; y_obstacle=20; w_obstacle=55; h_obstacle=35; curvature=0.7;
obstacles(2,1)=x_obstacle; obstacles(2,2)=y_obstacle; 
obstacles(2,3)=w_obstacle; obstacles(2,4)=h_obstacle; obstacles(2,5)=curvature;
add_obstacle(environment, matrix, x_obstacle, y_obstacle, w_obstacle, h_obstacle);
plot_obstacle(environment, x_obstacle, y_obstacle, w_obstacle, h_obstacle, curvature)

x_obstacle=65; y_obstacle=80; w_obstacle=40; h_obstacle=30; curvature=0.9;
obstacles(3,1)=x_obstacle; obstacles(3,2)=y_obstacle; 
obstacles(3,3)=w_obstacle; obstacles(3,4)=h_obstacle; obstacles(3,5)=curvature;
add_obstacle(environment, matrix, x_obstacle, y_obstacle, w_obstacle, h_obstacle);
plot_obstacle(environment, x_obstacle, y_obstacle, w_obstacle, h_obstacle, curvature)

x_obstacle=120; y_obstacle=60; w_obstacle=30; h_obstacle=60; curvature=0.3;
obstacles(4,1)=x_obstacle; obstacles(4,2)=y_obstacle; 
obstacles(4,3)=w_obstacle; obstacles(4,4)=h_obstacle; obstacles(4,5)=curvature;
add_obstacle(environment, matrix, x_obstacle, y_obstacle, w_obstacle, h_obstacle);
plot_obstacle(environment, x_obstacle, y_obstacle, w_obstacle, h_obstacle, curvature)

x_obstacle=170; y_obstacle=65; w_obstacle=50; h_obstacle=30; curvature=0.1;
obstacles(5,1)=x_obstacle; obstacles(5,2)=y_obstacle; 
obstacles(5,3)=w_obstacle; obstacles(5,4)=h_obstacle; obstacles(5,5)=curvature;
add_obstacle(environment, matrix, x_obstacle, y_obstacle, w_obstacle, h_obstacle);
plot_obstacle(environment, x_obstacle, y_obstacle, w_obstacle, h_obstacle, curvature)

x_obstacle=180; y_obstacle=10; w_obstacle=70; h_obstacle=30; curvature=0.5;
obstacles(6,1)=x_obstacle; obstacles(6,2)=y_obstacle; 
obstacles(6,3)=w_obstacle; obstacles(6,4)=h_obstacle; obstacles(6,5)=curvature;
add_obstacle(environment, matrix, x_obstacle, y_obstacle, w_obstacle, h_obstacle);
plot_obstacle(environment, x_obstacle, y_obstacle, w_obstacle, h_obstacle, curvature)

add_point(environment, start);
add_point(environment, goal);