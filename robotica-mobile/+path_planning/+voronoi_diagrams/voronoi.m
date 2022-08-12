% 1) [vx,vy]=voronoi
% 2) ripulire [vx,vy] da ostacoli noti
% v = []
% 3) costruisci il grafo a partire dai nodi tramite matrice di adiacenza
% funzione graph MATLAB
% 4 opzionale) applichi algoritmo percorso minimo sul grafo per ottenere il
%              percorso del robot (dijkstra, ...)

global start goal X Y grid nr_obstacles obstacles;

x_start=start(1); y_start=start(2);
x_goal=goal(1); y_goal=goal(2);

%% VORONOI MAP

x = X.*grid; y = Y.*grid; x = x(:); y = y(:);
figure(); voronoi(x,y);
[vx,vy] = voronoi(x,y);

% %% VORONOI MAP CLEANUP
% import path_planning.voronoi_diagrams.voronoi_map_cleanup;
% [vxc,vyc] = voronoi_map_cleanup(vx, vy, nr_obstacles, obstacles);
% 
% %% START E GOAL IN VORONOI MAP
% v = [];
% for i = 1 : length(vx)
%     v = [v ; [vx(1,i) vy(1,i)] ; [vx(2,i) vy(2,i)]];
% end
% 
% vnormstart = v-[start(1) start(2)];
% vnormgoal = v-[goal(1) goal(2)];
% for i = 1 : size(v,1)
%     vnormstart(i,:) = norm(vnormstart(i,:));
%     vnormgoal(i,:) = norm(vnormgoal(i,:));
% end
% [~,istart] = min(vnormstart);
% [~,igoal] = min(vnormgoal);
% vstart = v(istart(1),:); vgoal = v(igoal(1),:);
% 
% vx = [vx  [start(1) ; vstart(1)]  [goal(1) ; vgoal(1)]];
% vy= [vy   [start(2) ; vstart(2)]  [goal(2) ; vgoal(2)]];
% v = [v ; [start(1) start(2)] ; [vstart(1) vstart(2)] ; [goal(1) goal(2)] ; [vgoal(1) vgoal(2)]];
% 
% figure(); plot(vx, vy, "g", "linewidth",2); hold on;
% plot(start(1),start(2),"ok","linewidth",2); hold on;
% plot(goal(1),goal(2),"ok","linewidth",2);