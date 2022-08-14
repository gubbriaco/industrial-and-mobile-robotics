function trajectory = voronoi(start, goal, X, Y, grid, obstacles)

   

    x_start = start(1); x_goal = goal(1);
    y_start = start(2); y_goal = goal(2);

    %% GENERAZIONE DIAGRAMMA DI VORONOI
    x = X.*grid; y = Y.*grid; x = x(:); y = y(:);
    figure(); voronoi(x,y);
    [vx,vy] = voronoi(x,y);

    %% CLEANUP VORONOI DIAGRAM

    % Per ogni coppia di vertici in [vx,vy], dovró scorrere tutti gli ostacoli e vedere
    % se ci sono delle intersezioni: basta che il segmento tra i due vertici intersechi
    % un solo vertice e il segmento viene cancellato dalla mappa.
    for i = length(vx) : -1 : 1

        x_line = vx(:,i); y_line = vy(:,i);

        for j = 1 : size(obstacles,1)
            x_obst = [obstacles(j,1) obstacles(j,2)];
            y_obst = [obstacles(j,3) obstacles(j,4)];
      import path_planning.voronoi_diagrams.obstacle_intersect_verification;
            if obstacle_intersect_verification(x_line,y_line,x_obst,y_obst)
                vx(:,i) = []; vy(:,i) = [];
                break;
            end
        end
    end


    %% Ritrazione 

    % Unisco i punti di start e goal alla mappa di voronoi generata. In realtá qui la
    % ritrazione avviene in maniera molto naive: si dovrebbe controllare se innanzitutto
    % esiste e in caso se i due segmenti non intersecano nessun ostacolo. Qui connetto i
    % punti di start e goal semplicemente al nodo piú vicino della mappa di voronoi.

    % Metto tutti i vertici in unico vettore v:
    % inserisco la "v" precedente cosi' che il nuovo "v" avra' il v' precedente
    % piu' i "nuovi" ([vx(1,i) vy(1,i)] ; [vx(2,i) vy(2,i)])
    v = [];
    for i = 1 : length(vx)
        v = [v ; [vx(1,i) vy(1,i)] ; [vx(2,i) vy(2,i)]];
    end

    % Cerco quindi tra i vertici di v quello che é meno distante da start e goal e unisco
    % quest'ultimi al vettore v
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


    %% Plot della mappa finale

    figure(); plot(vx, vy, "g", "linewidth",2); hold on;
    plot(x_start, y_start, "ok", "linewidth",2); hold on;
    plot(x_goal, y_goal, "ok", "linewidth",2); hold on;
    axis("equal"), axis([0 100 0 100]), hold on; 
    for i = 1 : size(obstacles, 1)
        ob = obstacles(i,:);
        x_ob=ob(1);
        y_ob=ob(3);
        w_ob=ob(2)-ob(1);
        h_ob=ob(4)-ob(3);
        rectangle("position",[x_ob y_ob w_ob h_ob],"facecolor","r");
    end


    
    %% Creazione grafo tramite matrice di adiacenza

    % Siccome in v la sequenza di segmenti é alla rinfusa, vertici adiacenti possono 
    % essere in posizioni molto diverse. Quindi, tramite findZeroRows trovo vertici 
    % coincidenti in v. In seguito, si segue il principio che i vertici viaggiano a coppie 
    % in cui il primo vertice é di indice dispari e il secondo di indice pari.

    A = zeros(length(v));
    vtemp = v;
    for i = length(vtemp) : -1 : 1
        temp = (vtemp-vtemp(i,:));
        import path_planning.voronoi_diagrams.findZeroRows;
        occ = findZeroRows(temp);
        for j = 1 : length(occ)
            index = occ(j);
            if mod(index,2) == 0
                A(i,index-1) = 1;
            elseif index < length(vtemp)
                A(i,index+1) = 1;
            end
        end
        A(i,i) = 0;
        vtemp(i,:) = [];
    end

    G = graph(A,"lower");
    figure(); plot(vx, vy, "g", "linewidth",2); hold on;
    plot(x_start, y_start, "ok", "linewidth",2); hold on;
    plot(x_goal, y_goal, "ok", "linewidth",2); hold on;
    axis("equal"), axis([0 100 0 100]), hold on; 
    for i = 1 : size(obstacles, 1)
        ob = obstacles(i,:);
        x_ob=ob(1);
        y_ob=ob(3);
        w_ob=ob(2)-ob(1);
        h_ob=ob(4)-ob(3);
        rectangle("position",[x_ob y_ob w_ob h_ob],"facecolor","r");
    end
    hold on; plot(G,"xdata",v(:,1),"ydata",v(:,2));

    path = shortestpath(G,length(v)-3,length(v)-1);
    trajectory = v(path,:);
    
end