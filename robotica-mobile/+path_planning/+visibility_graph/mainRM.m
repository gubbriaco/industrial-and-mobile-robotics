clear;close all;clear;

%% ROBOT 
% global radius_robot
% radius_robot=1;
% robot=Robot(radius_robot);
% 
% %% PLOT ROBOT
% figure(); plot(robot);

%% ENVIRONMENT
import RM.Environment
global x_origin y_origin width height start goal obstacles nr_obstacles grid;
x_origin=1; y_origin=1;
start = [6,6];
goal = [80,90];

obstacles=[];
nr_obstacles=0;
width=100; height=100;
offset_grid=1;


height_obs=1;

environment = Environment(width, height);



% % DISCRETE POTENTIAL FIELDS
% obstacle_height=inf;
% inizialize(environment, obstacle_height);
% import RM.DiscretePotentialFields;
% DiscretePotentialFields(start,goal,width, height,grid);
% plot(environment);

%% VORONOI DIAGRAMS
obstacle_height=1;
inizialize(environment, obstacle_height);
import RM.voronoii 
voronoii;
plot(environment);

% %% VISIBILITY GRAPH
% obstacle_height=1;
% inizialize(environment, obstacle_height);
% import RM.visibilitygraph;
% visibilitygraph(start,goal,obstacles);
% plot(environment);
