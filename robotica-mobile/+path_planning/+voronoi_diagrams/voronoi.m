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

%% VORONOI MAP CLEANUP
import path_planning.voronoi_diagrams.obstacle_intersect;
for i = length(vx) : -1 : 1
    
    xvector = vx(:,i); yvector = vy(:,i);
    for j = 1 : size(obstacles,1)
         x_obst = [obstacles(j,1) obstacles(j,2)];
         y_obst = [obstacles(j,3) obstacles(j,4)];
         
         if obstacle_intersect(xvector,yvector,x_obst,y_obst)
            vx(:,i)=[]; 
            vy(:,i)=[];
            break;
        end
    end
end

%% START E GOAL IN VORONOI MAP
v = [];
for i = 1 : length(vx)
    v = [v ; [vx(1,i) vy(1,i)] ; [vx(2,i) vy(2,i)]];
end

vnormstart = v-[start(1) start(2)];
vnormgoal = v-[goal(1) goal(2)];
for i = 1 : size(v,1)
    vnormstart(i,:) = norm(vnormstart(i,:));
    vnormgoal(i,:) = norm(vnormgoal(i,:));
end
vnormstart = v-[x_start y_start];
vnormgoal = v-[x_goal y_goal];
for i = 1 : size(v,1)
    vnormstart(i,:) = norm(vnormstart(i,:));
    vnormgoal(i,:) = norm(vnormgoal(i,:));
end
[~,istart] = min(vnormstart);
[~,igoal] = min(vnormgoal);
vstart = v(istart(1),:); vgoal = v(igoal(1),:);

vx = [vx  [x_start ; vstart(1)]  [x_goal ; vgoal(1)]];
vy= [vy   [y_start ; vstart(2)]  [y_goal ; vgoal(2)]];
v = [v ; [x_start y_start] ; [vstart(1) vstart(2)] ; [x_goal y_goal] ; [vgoal(1) vgoal(2)]];

figure(); plot(vx, vy, "g", "linewidth",2); hold on;
plot(x_start,y_start,"ok","linewidth",2); hold on;
plot(x_goal,y_goal,"ok","linewidth",2); hold on;
for i = 1 : size(obstacles,1)
	ob = obstacles(i,:);
    x_ob = ob(3);
    y_ob = ob(1);
    w_ob = ob(4)-x_ob;
    h_ob = ob(2)-y_ob;
    rectangle("position",[x_ob y_ob w_ob h_ob],"facecolor","r");
end
