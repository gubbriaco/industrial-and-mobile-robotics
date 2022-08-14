clear; close all; clc;
import robot.Robot;


%% ROBOT
global radius_robot
radius_robot = 1;
robot = Robot(radius_robot);
% PLOT ROBOT
figure(); plot(robot);

%% START & GOAL
x_start=5; y_start=5;
x_goal=95; y_goal=95;
start = [x_start y_start]; goal = [x_goal y_goal];

%% ENVIRONMENT
width=100; height=100;
nc=100; nr=100;
import environment.Environment;
environment = Environment(width, height, nc, nr);
inizialize(environment);
global X Y grid obstacles

%% DISCRETE POTENTIAL FIELDS
obstacle_height=Inf;
add_obstacles(environment, obstacle_height);
plot(environment);
import path_planning.discrete_potential_fields.discrete_potential_fields;
discrete_potential_fields(start, goal, width, height, grid);


%% VORONOI DIAGRAMS
obstacle_height=1;
add_obstacles(environment, obstacle_height);
plot(environment);
import path_planning.voronoi_diagrams.voronoi;
P = voronoi(start, goal, X, Y, grid, obstacles);





