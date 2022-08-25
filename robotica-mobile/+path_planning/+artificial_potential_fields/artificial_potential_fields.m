%
% PotentialFieldScript.m
%
clear;
close all;
global start goal obstacles width health; 
%% Generate some points

% nrows = 400;
% ncols = 600;
% 
% obstacle = false(nrows, ncols);

[x, y] = meshgrid (1:health, 1:width);

%% Generate some obstacle

% obstacle (300:end, 100:250) = true;
% obstacle (150:200, 400:500) = true;
% 
% t = ((x - 200).^2 + (y - 50).^2) < 50^2;
% obstacle(t) = true;
% 
% t = ((x - 400).^2 + (y - 300).^2) < 100^2;
% obstacle(t) = true;

%% Compute distance transform

d = bwdist(obstacles); %bdwist function restituisce la distanza da ogni "true" element nell'array degli ostacoli

% Rescale and transform distances

Rho = (d/100) + 1; %aggiungiamo l'1 perchè qualche
                  %valore di d=0 e potremmo avere
                  %problemi nel calcolo del repulsivo
d0 = 2;     %peso del repulsivo. Se il robot si allonana più di d0 il repulsivo sarà pari a 0
Eta = 800;  %utilizzando per controllare la forza del repulsivo
            %Eta grande crea molta differenza tra forza repulsiva e
            %attrattiva. Bisogna mettere il repulsivo ampio per fare in
            %modo che il robot non vada contro l'ostacolo

repulsive = Eta*((1./Rho - 1/d0).^2);

repulsive (Rho > d0) = 0;


%% Display repulsive potential

figure;
m = mesh (repulsive);
m.FaceLighting = 'phong';
axis equal;

title ('Repulsive Potential');

%% Compute attractive force

goal = [400, 50];

xi = 1/700;     %usato per controllare la forza attrattiva
                %per esempio se xi=1/1000 il robot non raggiunge il goal
                %perchè la forza attrattiva è poca
                %per xi=1/10, il robot passa attraverso gli ostacoli

attractive = xi * ( (x - goal(1)).^2 + (y - goal(2)).^2 );

figure;
m = mesh (attractive);
m.FaceLighting = 'phong';
axis equal;

title ('Attractive Potential');

%% Display 2D configuration space
start = [50, 350];
figure;
imshow(~obstacle);

hold on;
plot (goal(1), goal(2), 'r.', 'MarkerSize', 50);
plot (start(1), start(2), 'g.', 'MarkerSize', 50);
hold off;

axis ([0 ncols 0 nrows]);
axis xy;
axis on;

xlabel ('x');
ylabel ('y');
legend('Goal', 'Start')

title ('Configuration Space');

%% Combine terms

f = attractive + repulsive;

figure;
m = mesh (f);
m.FaceLighting = 'phong';
axis equal;

title ('Total Potential');

%% Plan route
 % goal = [400, 50];
% start = [280, 350];

import path_planning.artificial_potential_fields.gradient_based_planner;
route = gradient_based_planner(f, start, goal, 1000);

%% Plot the energy surface

figure;
m = mesh (f);
axis equal;

%% Plot ball sliding down hill

animate = 1;
if animate
    [sx, sy, sz] = sphere(20);

    scale = 20;
    sx = scale*sx;
    sy = scale*sy;
    sz = scale*(sz+1);

    hold on;
    p = mesh(sx, sy, sz);
    p.FaceColor = 'red';
    p.EdgeColor = 'none';
    p.FaceLighting = 'phong';
    hold off;

    for i = 1:size(route,1)
        P = round(route(i,:));
        z = f(P(2), P(1));

        p.XData = sx + P(1);
        p.YData = sy + P(2);
        p.ZData = sz + f(P(2), P(1));

        drawnow;

        drawnow;

    end
end

%% quiver plot
[gx, gy] = gradient (-f);
skip = 10;

figure;

xidx = 1:skip:ncols;
yidx = 1:skip:nrows;

quiver (x(yidx,xidx), y(yidx,xidx), gx(yidx,xidx), gy(yidx,xidx), 0.4);

axis ([1 ncols 1 nrows]);

hold on;

ps = plot(start(1), start(2), 'r.', 'MarkerSize', 30);
pg = plot(goal(1), goal(2), 'g.', 'MarkerSize', 30);
p3 = plot (route(:,1), route(:,2), 'r', 'LineWidth', 2);
xlabel('X')
ylabel('Y')
