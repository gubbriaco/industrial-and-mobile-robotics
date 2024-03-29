clear; close all; clc;

%% INPUT PLOT VISUALIZATION
import data_input.main_input;
DYNAMIC_ON = main_input();


%% INITIAL CONFIGURATION
% function che inizializza tutte le variabili (punti, robot, ...)
import init.init_exec;
init_exec();


%% LAMBDA AND SIGMA
import sigma_lambda.sigma_lambda_exec;
sigma_lambda_exec();


%% TIME DEFINITION 
import time.time_definition;
T = time_definition();
 

%% TRIANGLE
import plot.Plot;
if isequal(DYNAMIC_ON, 1)
    Plot.points();
end
import triangle.triangle_exec;
triangle_exec(T, DYNAMIC_ON);

%% TRIANGLE PATH PLOT 
import plot.Plot;
Plot.triangle();

f=figure(); f.Position=[350 350 800 400];
subplot(2,2,1); Plot.triangle_coverage();
subplot(2,2,3); Plot.triangle_coverage_speed();
subplot(2,2,2); Plot.triangle_joint_variables();
subplot(2,2,4); Plot.triangle_joint_variables_speed();
sgtitle("TRIANGLE COVERAGE TREND");

%% TRIANGLE PATH ERROR 
import error.Error;
Error.triangle();



%% CIRCUMFERENCE
global circumference_center circumference_radius
%centro circonferenza
circumference_center = [1;0.95;0.5];
%raggio circonferenza
circumference_radius = 0.25;

import plot.Plot;
if isequal(DYNAMIC_ON, 1)
    Plot.points();
end
import circumference.circumference_exec;
circumference_exec(DYNAMIC_ON);

%% CIRCUMFERENCE PATH PLOT
import plot.Plot;
Plot.circumference();

f=figure(); f.Position=[350 350 800 400];
subplot(2,2,1); Plot.circumference_coverage();
subplot(2,2,3); Plot.circumference_coverage_speed();
subplot(2,2,2); Plot.circumference_joint_variables();
subplot(2,2,4); Plot.circumference_joint_variables_speed();
sgtitle("CIRCUMFERENCE COVERAGE TREND");

%% CIRCUMFERENCE ERROR
import error.Error;
Error.circumference();


%% INPUT PLOT WITH TIME VISUALIZATION
if isequal(DYNAMIC_ON, 1)
    import data_input.plot_time_input;
    PLOT_WITH_TIME = plot_time_input();

    %% PLOT WITH TIME
    if isequal(PLOT_WITH_TIME, 1)
        import plot.Plot;
        Plot.triangle_40sec();
        Plot.circumference_40sec();
    end

end


