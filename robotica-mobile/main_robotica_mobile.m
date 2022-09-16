clear; close all; clc;


%% ROBOT
global radius_robot
% definisco il raggio del robot:
% il robot dovrebbe essere implementato come puntiforme e, pertanto, con
% raggio (idealmente) pari a 0.5 ma per motivi di implementazione (indexing)
% il raggio e' stato scelto pari a 1
radius_robot = 1;
import robot.Robot;
% creo il tipo di oggetto Robot usando il concetto di programmazione 
% orientata agli oggetti presente in MATLAB®
robot = Robot(radius_robot);
% plot robot
figure(); plot(robot);

%% START & GOAL
% definisco le coordinate di start
x_start=5; y_start=5;
% definisco le coordinate di goal
x_goal=90; y_goal=90;
global start goal
start=[x_start y_start]; goal=[x_goal y_goal];

%% ENVIRONMENT
% definisco larghezza e altezza (in termini di plot) dell'ambiente
global width height
width=100; height=100;
nc=100; nr=100;
import environment.Environment;
% definisco il tipo di oggetto Environment
global environment
environment = Environment(width, height, nc, nr);
% inizializzo l'environment
inizialize(environment);
% aggiungo gli ostacoli all'environment giusto per uno scopo di plot, cioe'
% per rappresentare graficamente l'ambiente in questione (successivamente 
% ogni path planning prevede l'aggiunta degli ostacoli ai fini di 
% implementazione)
add_obstacles(environment, 7);
% effettuo un plot 3D e 2D dell'environment in questione
f=figure(); f.Position=[250 342 1000 420]; 
subplot(1,2,1); plot2D(environment);
subplot(1,2,2); plot3D(environment);


%% EXEC
% tale script esegue i diversi path planning progettati ed, inoltre, per
% ogni path planning viene eseguito ogni algoritmo di controllo progettato
% @see path_planning.path_planning_exec
import path_planning.path_planning_exec;
disp("PER TERMINARE IL PROGRAMMA CLICCARE CTRL + C SULLA TASTIERA.");
disp(" ");
disp("Scegliere una tra le tipologie elencate. Gli input sono non case sensitive.");
disp("I formati di input per la tipologia di path planning sono:");
disp("a := Artificial Potential Fields");
disp("d := Discrete Potential Fields");
disp("vo := Voronoi Diagrams");
disp("vi := Visibility Graphs");
disp(" ");
type = input("Inserire la tipologia di path planning da simulare: ", "s");
type = "" + type;
path_planning_exec(environment, type);

