clear; close all; clc;

%% ********************************************************************
%% ********************************************************************
global links P1 P2 P3


%% INITIAL CONFIGURATION
init_exec();

%% KINEMATICS
import kinematics.kinematics;
[Qp, T01, T12, T23] = kinematics();


%% LAMBDA AND SIGMA
import sigma_lambda.sigma_lambda_exec;
global sigma_step sigma lambda derived_lambda
sigma_lambda_exec();

%% TIME DEFINITION 
import time.time_definition;
T = time_definition();
 
%% TRIANGLE
import plot.Plot;
Plot.points();
import triangle.triangle_exec;
global P1P2_segment P2P3_segment P3P1_segment
global P1P2_derived_segment P2P3_derived_segment P3P1_derived_segment
global Q1Q2_segment Q2Q3_segment Q3Q1_segment
global Q1Q2_derived_segment Q2Q3_derived_segment Q3Q1_derived_segment
triangle_exec(T, Qp);


%% ERRORE triangolo
import error.Error;
Error.triangle();

%% PLOT PERCORSO TRIANGOLO
import plot.Plot;
Plot.triangle();

Plot.triangle_joint_variables();
Plot.triangle_joint_variables_speed();
Plot.triangle_coverage_speed();
return

%% CIRCONFERENZA
global circumference_center circumference_radius

%centro circonferenza
circumference_center = [1;0.95;0.5];
%raggio circonferenza
circumference_radius = 0.25;

Plot.points();
import circumference.circumference_exec;
circumference_exec();


%% ERRORE circonferenza
Errore.Circonferenza(P1P2_arch, Q1Q2_arch, P2P3_arch, Q2Q3_arch, P3P1_arch, Q3Q1_arch);

%% PLOT PERCORSO CIRCONFERENZA
Plot.Circonferenza(P1P2_arch, P2P3_arch, P3P1_arch);

Plot.VariabiliDiGiuntoCirconferenza(Q1Q2_arch, Q2Q3_arch, Q3Q1_arch);
Plot.VariabiliDiGiuntoDerivataCirconferenza(Q1Q2_derived_arch, Q2Q3_derived_arch, Q3Q1_derived_arch);
Plot.VelocitaCoperturaCirconferenza(P1P2_derived_arch, P2P3_derived_arch, P3P1_derived_arch);


%% PLOT CON TEMPO
Plot.Triangolo40Secondi(Q1Q2_segment, P1P2_segment, Q2Q3_segment, P2P3_segment, Q3Q1_segment, P3P1_segment);
Plot.Circonferenza40Secondi(Q1Q2_arch, P1P2_arch, Q2Q3_arch, P2P3_arch, Q3Q1_arch, P3P1_arch);
