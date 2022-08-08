import path_planning.discrete_potential_fields.map_creation;
import path_planning.discrete_potential_fields.rectangle_insertion;
import path_planning.discrete_potential_fields.distances;
import path_planning.discrete_potential_fields.search_path;

height_environment = 125;
width_environment = 275;

start = [124 1];
goal = [274 124];

delta=1;

environment = map_creation(width_environment,height_environment, delta);

%ostacoli: vertici senza ingrossamento
% OBSTACLE NR.1
x_obstacle=20; y_obstacle=100; w_obstacle=20; h_obstacle=15; curvature=0.2;
environment = rectangle_insertion(x_obstacle, y_obstacle, w_obstacle, h_obstacle,environment, delta);
% OBSTACLE NR.2
x_obstacle=45; y_obstacle=20; w_obstacle=55; h_obstacle=35; curvature=0.7;
environment = rectangle_insertion(x_obstacle, y_obstacle, w_obstacle, h_obstacle,environment, delta);
% OBSTACLE NR.3
x_obstacle=65; y_obstacle=80; w_obstacle=40; h_obstacle=30; curvature=0.9;
environment = rectangle_insertion(x_obstacle, y_obstacle, w_obstacle, h_obstacle,environment, delta);
% OBSTACLE NR.4
x_obstacle=120; y_obstacle=60; w_obstacle=30; h_obstacle=55; curvature=0.3;
environment = rectangle_insertion(x_obstacle, y_obstacle, w_obstacle, h_obstacle,environment, delta);
% OBSTACLE NR.5
x_obstacle=170; y_obstacle=65; w_obstacle=50; h_obstacle=30; curvature=0.1;
environment = rectangle_insertion(x_obstacle, y_obstacle, w_obstacle, h_obstacle,environment, delta);
% OBSTACLE NR.6
x_obstacle=180; y_obstacle=10; w_obstacle=70; h_obstacle=30; curvature=0.5;
environment = rectangle_insertion(x_obstacle, y_obstacle, w_obstacle, h_obstacle,environment, delta);

%mappa dei potenziali
discrete_potential_map = distances(goal(1),goal(2), environment);

%percorso minimo
[cell_path, pathMap] = search_path(start(1),start(2), discrete_potential_map);
