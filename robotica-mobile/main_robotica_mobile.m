clear; close all; clc;
import robot.Robot;
import environment.Environment;


%% ROBOT
global radius_robot
radius_robot = 1;
robot = Robot(radius_robot);
% PLOT ROBOT
figure(); plot(robot);

%% ENVIRONMENT
global x_origin y_origin width height start goal nr_obstacles obstacles;
nr_obstacles = 0; obstacles = [];
x_origin=1; y_origin=1;
width=100; height=100;
offset = 4;
start = [x_origin+offset y_origin+offset];
goal = [width-offset height-offset];

environment = Environment(width, height, start, goal);
inizialize(environment);
add_walls(environment);
add_obstacles(environment);
plot(environment);

%% VORONOI DIAGRAMS
import path_planning.voronoi_diagrams.voronoi;
voronoi;




