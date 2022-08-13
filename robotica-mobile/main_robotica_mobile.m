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


%% VORONOI DIAGRAMS
import path_planning.voronoi_diagrams.voronoi;
P = voronoi(start, goal);





