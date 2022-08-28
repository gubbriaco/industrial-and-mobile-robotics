%clear; close all; clc;

%% ROBOT
global radius_robot
radius_robot = 0.5;
import robot.Robot;
robot = Robot(radius_robot);
% PLOT ROBOT
figure(); plot(robot); grid off;

%% START & GOAL
x_start=5; y_start=5;
x_goal=90; y_goal=90;
global start goal
start = [x_start y_start]; goal = [x_goal y_goal];

%% ENVIRONMENT
% inizializzo l'ambiente e gli ostacoli al suo interno
global width height
width=100; height=100;
nc=100; nr=100;
import environment.Environment;
environment = Environment(width, height, nc, nr);
inizialize(environment);
figure(); plot2D(environment);


%% EXEC
% tale script esegue i diversi path planning progettati ed, inoltre, per
% ogni path planning viene eseguito ogni algoritmo di controllo progettato
import path_planning.path_planning_exec;
path_planning_exec(environment);

