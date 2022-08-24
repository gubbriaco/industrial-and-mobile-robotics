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
global start goal
start = [x_start y_start]; goal = [x_goal y_goal];

%% ENVIRONMENT
global width height
width=100; height=100;
nc=100; nr=100;
import environment.Environment;
environment = Environment(width, height, nc, nr);
inizialize(environment);


%% EXEC
import path_planning.path_planning_exec;
path_planning_exec(environment);

