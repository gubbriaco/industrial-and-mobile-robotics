clear; close all; clc;

%% ROBOT
global radius_robot
radius_robot = 1;
import robot.Robot;
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
global X Y grid obstacles
inizialize(environment);

%% DISCRETE POTENTIAL FIELDS
obstacle_height=Inf;
add_obstacles(environment, obstacle_height);
plot(environment);
import path_planning.discrete_potential_fields.discrete_potential_fields;
P = discrete_potential_fields(start, goal, width, height, grid);
figure(); 
hold on; plot(start(1),start(2), "*", "Color","b");
hold on; plot(goal(1),goal(2), "*", "Color","g");
hold on; plot(P(:,1), P(:,2)); title("DISCRETE POTENTIAL FIELDS PATH");

%% VORONOI DIAGRAMS
obstacle_height=1;
add_obstacles(environment, obstacle_height);
plot(environment);
import path_planning.voronoi_diagrams.voronoi;
P = voronoi(start, goal, X, Y, grid, obstacles);
figure(); 
hold on; plot(start(1),start(2), "*", "Color","b");
hold on; plot(goal(1),goal(2), "*", "Color","g");
hold on; plot(P(:,1), P(:,2)); title("VORONOI DIAGRAMS PATH");

