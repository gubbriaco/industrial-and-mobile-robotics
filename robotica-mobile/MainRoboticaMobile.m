clear; close all; clc;
import robot.*;
import environment.*;


%% ROBOT
global radius_robot
radius_robot = 5;
robot = Robot(radius_robot);
% PLOT ROBOT
figure(); Robot.plot();

%% ENVIRONMENT
global width height
width = 1280; height = 720;
environment = Environment(width, height);
% PLOT ENVIRONMENT
figure(); Environment.plot(); Environment.add_obstacles();
