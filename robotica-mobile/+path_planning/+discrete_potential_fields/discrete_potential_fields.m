clc; clear; close all;
import path_planning.discrete_potential_fields.map_creation;
import path_planning.discrete_potential_fields.rectangle_insertion;
import path_planning.discrete_potential_fields.distances;
import path_planning.discrete_potential_fields.search_path;

height_environment = 125;
width_environment = 275;

start = [2 2];
goal = [273 123];

delta=1;

environment = map_creation(width_environment,height_environment, delta);

% OBSTACLE NR.1
x_obstacle=15; y_obstacle=15; w_obstacle=30; h_obstacle=40; curvature=0.2;
environment = rectangle_insertion(x_obstacle, y_obstacle, w_obstacle, h_obstacle,environment, delta);
% OBSTACLE NR.2
x_obstacle=55; y_obstacle=60; w_obstacle=20; h_obstacle=45; curvature=0.7;
environment = rectangle_insertion(x_obstacle, y_obstacle, w_obstacle, h_obstacle,environment, delta);
% OBSTACLE NR.3
x_obstacle=80; y_obstacle=15; w_obstacle=160; h_obstacle=35; curvature=0.9;
environment = rectangle_insertion(x_obstacle, y_obstacle, w_obstacle, h_obstacle,environment, delta);
% OBSTACLE NR.4
x_obstacle=110; y_obstacle=60; w_obstacle=30; h_obstacle=15; curvature=0.3;
environment = rectangle_insertion(x_obstacle, y_obstacle, w_obstacle, h_obstacle,environment, delta);
% OBSTACLE NR.5
x_obstacle=120; y_obstacle=85; w_obstacle=140; h_obstacle=20; curvature=0.1;
environment = rectangle_insertion(x_obstacle, y_obstacle, w_obstacle, h_obstacle,environment, delta);
% OBSTACLE NR.6
x_obstacle=15; y_obstacle=75; w_obstacle=25; h_obstacle=40; curvature=0.5;
environment = rectangle_insertion(x_obstacle, y_obstacle, w_obstacle, h_obstacle,environment, delta);

%mappa dei potenziali
discrete_potential_map = distances(goal(1),goal(2), environment);

%percorso minimo
[cell_path, path_map] = search_path(start(1),start(2), discrete_potential_map);
figure(); title("PATH MAP");
surface(path_map); axis off;
hold on; plot(start(1), start(2), "*", "LineWidth",4, "Color","#124ee6");
hold on; plot(goal(1)+1, goal(2)+1, "*", "LineWidth", 4, "Color","#0eb04f"); 

figure(); title("CELL PATH");
size_cell_path=size(cell_path);
plot(cell_path(:,1), cell_path(:,2)); xlim([1 width_environment]); ylim([1 height_environment]);
hold on; plot(start(1), start(2), "*", "LineWidth",4, "Color","#124ee6");
hold on; plot(goal(1)+1, goal(2)+1, "*", "LineWidth", 4, "Color","#0eb04f"); 
        
