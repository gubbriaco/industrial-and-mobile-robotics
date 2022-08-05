clear; close all; clc;
import robot.Robot;
import environment.Environment;
import environment.Obstacle;


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
environment = Environment(width, height);
% PLOT ENVIRONMENT
figure(); plot(environment);

nr_obstacles=6;

% OBSTACLE NR.1
x_obstacle=20; y_obstacle=100; w_obstacle=20; h_obstacle=25; curvature=0.2;
obstacle = Obstacle(x_obstacle, y_obstacle, w_obstacle, h_obstacle, curvature);
obstacles(1) = obstacle;
add_obstacle(environment, obstacle);
plot(obstacle);

% OBSTACLE NR.2
x_obstacle=45; y_obstacle=20; w_obstacle=55; h_obstacle=35; curvature=0.7;
obstacle = Obstacle(x_obstacle, y_obstacle, w_obstacle, h_obstacle, curvature);
obstacles(1) = obstacle;
add_obstacle(environment, obstacle);
plot(obstacle);

% OBSTACLE NR.3
x_obstacle=65; y_obstacle=80; w_obstacle=40; h_obstacle=30; curvature=0.9;
obstacle = Obstacle(x_obstacle, y_obstacle, w_obstacle, h_obstacle, curvature);
obstacles(1) = obstacle;
add_obstacle(environment, obstacle);
plot(obstacle);

% OBSTACLE NR.4
x_obstacle=120; y_obstacle=60; w_obstacle=30; h_obstacle=60; curvature=0.3;
obstacle = Obstacle(x_obstacle, y_obstacle, w_obstacle, h_obstacle, curvature);
obstacles(1) = obstacle;
add_obstacle(environment, obstacle);
plot(obstacle);

% OBSTACLE NR.5
x_obstacle=170; y_obstacle=65; w_obstacle=50; h_obstacle=30; curvature=0.1;
obstacle = Obstacle(x_obstacle, y_obstacle, w_obstacle, h_obstacle, curvature);
obstacles(1) = obstacle;
add_obstacle(environment, obstacle);
plot(obstacle);

% OBSTACLE NR.6
x_obstacle=180; y_obstacle=10; w_obstacle=70; h_obstacle=30; curvature=0.5;
obstacle = Obstacle(x_obstacle, y_obstacle, w_obstacle, h_obstacle, curvature);
obstacles(1) = obstacle;
add_obstacle(environment, obstacle);
plot(obstacle);

%% START E GOAL
add_point(environment, start);
add_point(environment, goal);


%% OBSTACLES SHAPE
cd path_planning\ostacle_shape
run('enlarge_obstacles')
