% 1) [vx,vy]=voronoi
% 2) ripulire [vx,vy] da ostacoli noti
% v = []
% 3) costruisci il grafo a partire dai nodi tramite matrice di adiacenza
% funzione graph MATLAB
% 4 opzionale) applichi algoritmo percorso minimo sul grafo per ottenere il
%              percorso del robot (dijkstra, ...)
function trajectory = voronoi(start, goal)

    import path_planning.voronoi_diagrams.ostacoli;
    [X,Y,grid,obstacles] = ostacoli();

    xstart=start(1); ystart=start(2);
    xgoal=goal(1); ygoal=goal(2);

    %% VORONOI MAP

    x = X.*grid; y = Y.*grid; x = x(:); y = y(:);
    figure(); voronoi(x,y);
    [vx,vy] = voronoi(x,y);

    %% VORONOI MAP CLEANUP
    import path_planning.voronoi_diagrams.obstacle_intersect;
    for i = length(vx) : -1 : 1

        xline = vx(:,i); yline = vy(:,i);
        
        for j = 1 : size(obstacles,1)
            xobst = [obstacles(j,1) obstacles(j,2)];
            yobst = [obstacles(j,3) obstacles(j,4)];
  
            if obstacle_intersect(xline,yline,xobst,yobst)
                vx(:,i) = []; vy(:,i) = [];
                break;
            end
        end
    end

    %% START E GOAL IN VORONOI MAP
    v = [];
    for i = 1 : length(vx)
        v = [v ; [vx(1,i) vy(1,i)] ; [vx(2,i) vy(2,i)]];
    end

    vnormstart = v-[xstart ystart];
    vnormgoal = v-[xgoal ygoal];
    for i = 1 : size(v,1)
        vnormstart(i,:) = norm(vnormstart(i,:));
        vnormgoal(i,:) = norm(vnormgoal(i,:));
    end
    [~,istart] = min(vnormstart);
    [~,igoal] = min(vnormgoal);
    vstart = v(istart(1),:); vgoal = v(igoal(1),:);
    
    vx = [vx  [xstart ; vstart(1)]  [xgoal ; vgoal(1)]];
    vy= [vy   [ystart ; vstart(2)]  [ygoal ; vgoal(2)]];
    v = [v ; [xstart ystart] ; [vstart(1) vstart(2)] ; [xgoal ygoal] ; [vgoal(1) vgoal(2)]];


    figure(); plot(vx, vy, "g", "linewidth",2); hold on;
    plot(xstart,ystart,"ok","linewidth",2); hold on;
    plot(xgoal,ygoal,"ok","linewidth",2); hold on;
    for i = 1 : size(obstacles,1)
        ob = obstacles(i,:);
        x_ob = ob(3);
        y_ob = ob(1);
        w_ob = ob(4)-x_ob;
        h_ob = ob(2)-y_ob;
        rectangle("position",[x_ob y_ob w_ob h_ob],"facecolor","r");
    end
    
    trajectory=0;
end