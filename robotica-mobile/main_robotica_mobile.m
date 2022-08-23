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
global start goal
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
P = discrete_potential_fields(start, goal, width, height, grid, obstacles);
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
% import path_planning.visibility_graph.cleanup;
% P = cleanup(P);
% % Px = [P(1,1);P(2,1);P(4,1);P(8,1);P(10,1);P(13,1);P(16,1)];
% % Py = [P(1,2);P(2,1);P(4,1);P(8,1);P(10,1);P(13,1);P(16,1)];

%% CONTROL


%% TRAJECTORY GENERATION
import control.trajectory_tracking.trajectory_generation;
Ts = 0.1;
[samples, xstar, ystar, xdstar, ydstar, xddstar, yddstar, thetastar]...
                                                            = trajectory_generation(P, Ts);
x0 = xstar(1)-0.1;
y0 = ystar(1)+0.1;
theta0 = thetastar(1)+deg2rad(0.1);
Xg = [x0 y0 theta0];
evolution = zeros(samples, 3);
% %% CONTROL BASED ON APPROXIMATE LINEARIZATION
% import control.trajectory_tracking.approximated_linearization.approximated_linearization;
% figure();
% for i = 1 : samples
%     evolution(i,:) = Xg;
%     new_state = approximated_linearization(Ts, Xg, xstar(i), ystar(i), xdstar(i), ydstar(i),...
%                                            xddstar(i), yddstar(i), thetastar(i));
%     Xg = new_state;
%     hold on;
%     plot(Xg(1), Xg(2), '*');
% end
% %% NON LINEAR CONTROL
% import control.trajectory_tracking.non_linearization.non_linearization;
% figure();
% for i = 1 : samples
%     evolution(i,:) = Xg;
%     new_state = non_linearization(Ts, Xg, xstar(i), ystar(i), xdstar(i), ydstar(i),...
%                                            xddstar(i), yddstar(i), thetastar(i));
%     Xg = new_state;
%     hold on;
%     plot(Xg(1), Xg(2), '*');
% end

%% INPUT-OUTPUT LINEARIZATION
import control.trajectory_tracking.input_output_control.input_output_linearization;
figure();
for i = 1 : samples
    evolution(i,:) = Xg;
    new_state = input_output_linearization(Ts, Xg, xstar(i), xdstar(i), ystar(i), ydstar(i));
    Xg = new_state;
    hold on;
    plot(Xg(1), Xg(2), '*');
end



