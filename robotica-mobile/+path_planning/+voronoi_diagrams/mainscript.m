close all; clear; close all;

%% Motion Planning

x_start=5; y_start=5;
x_goal=95; y_goal=95;
start = [x_start y_start]; goal = [x_goal y_goal];

import path_planning.voronoi_diagrams.voronoi;
P = voronoi(start, goal);
