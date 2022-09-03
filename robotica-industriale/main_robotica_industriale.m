clear; close all; clc;


%% INITIAL CONFIGURATION
% function che inizializza tutte le variabili (punti, robot, ...)
init_exec();


%% KINEMATICS
import kinematics.kinematics;
kinematics();


%% LAMBDA AND SIGMA
import sigma_lambda.sigma_lambda_exec;
sigma_lambda_exec();


%% TIME DEFINITION 
import time.time_definition;
T = time_definition();
 

%% TRIANGLE
import plot.Plot;
Plot.points();
import triangle.triangle_exec;
triangle_exec(T);


%% TRIANGLE PATH ERROR 
import error.Error;
Error.triangle();


%% TRIANGLE PATH PLOT 
import plot.Plot;
Plot.triangle();
Plot.triangle_joint_variables();
Plot.triangle_joint_variables_speed();
Plot.triangle_coverage_speed();


%% CIRCUMFERENCE
global circumference_center circumference_radius

%centro circonferenza
circumference_center = [1;0.95;0.5];
%raggio circonferenza
circumference_radius = 0.25;

import plot.Plot;
Plot.points();
import circumference.circumference_exec;
circumference_exec();


%% CIRCUMFERENCE ERROR
import error.Error;
Error.circumference();


%% CIRCUMFERENCE PATH PLOT
import plot.Plot;
Plot.circumference();
Plot.circumference_joint_variables();
Plot.circumference_joint_variables_speed();
Plot.circumference_coverage_speed();


%% PLOT WITH TIME
import plot.Plot;
Plot.triangle_40sec();
Plot.circumference_40sec();



