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
global width height
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
hold on; plot(P(:,1), P(:,2)); title("DISCRETE POTENTIAL FIELDS SHORTEST PATH"); 
legend({"start", "goal", "shortest path"}, "Location","northwest");

%% VORONOI DIAGRAMS
obstacle_height=1;
add_obstacles(environment, obstacle_height);
plot(environment);
import path_planning.voronoi_diagram.voronoi;
P = voronoi(start, goal, X, Y, grid, obstacles);
figure(); 
hold on; plot(start(1),start(2), "*", "Color","b");
hold on; plot(goal(1),goal(2), "*", "Color","g");
hold on; plot(P(:,1), P(:,2)); title("VORONOI DIAGRAMS SHORTEST PATH"); 
legend({"start", "goal", "shortest path"}, "Location","northwest");

% %% VISIBILITY GRAPH
% obstacle_height=1;
% add_obstacles(environment, obstacle_height);
% plot(environment);
% import path_planning.visibility_graph.visibility_graph;
% P = visibility_graph(start, goal, obstacles);
% figure(); 
% hold on; plot(start(1),start(2), "*", "Color","b");
% hold on; plot(goal(1),goal(2), "*", "Color","g");
% hold on; plot(P(:,1), P(:,2)); title("VISIBILITY GRAPH SHORTEST PATH"); 
% legend({"start", "goal", "shortest path"}, "Location","northwest");



%% CONTROL

x = P(:,1);
y = P(:,2);
theta = atan2(x, y);

% grado di interpolazione
grade = 7;

%% TRAJECTORY GENERATION
import control.trajectory_tracking.trajectory_generation;
[xstar, ystar, xdotstar, ydotstar, thetastar] = trajectory_generation(P, grade);
figure();
hold on; plot(start(1),start(2), "*", "Color","b");
hold on; plot(goal(1),goal(2), "*", "Color","g");
hold on; plot(xstar, ystar); title("TRAJECTORY");


%% CONTROL BASED ON APPROXIMATE LINEARIZATION
[v,w] = approximated_linearization( xstar, xdotstar, x, ...
                                    ystar, ydotstar, y, ...
                                    theta, thetastar, ...
                                    vstar, omegastar)

%% NON LINEAR CONTROL


%% INPUT-OUTPUT LINEARIZATION



