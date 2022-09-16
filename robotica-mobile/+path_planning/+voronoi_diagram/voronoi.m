function trajectory = voronoi(environment)
    global start goal X Y grid obstacles

    x_start = start(1); x_goal = goal(1);
    y_start = start(2); y_goal = goal(2);

    %% GENERAZIONE DIAGRAMMA DI VORONOI
    x = X.*grid; y = Y.*grid; x = x(:); y = y(:);
    f=figure(); f.Position=[25 342 1500 420]; subplot(1,3,1);
    voronoi(x,y); title("VORONOI DIAGRAMS");
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
            import path_planning.voronoi_diagram.obstacle_intersect_verification;
            if obstacle_intersect_verification(x_line,y_line,x_obst,y_obst)
                vx(:,i) = []; vy(:,i) = [];
                break;
            end
        end
    end


    %% Ritrazione 

    % Unisco i punti di start e goal alla mappa di voronoi generata. In 
    % realtá qui la ritrazione avviene in maniera molto naive: si dovrebbe 
    % controllare se innanzitutto esiste e in caso se i due segmenti non 
    % intersecano nessun ostacolo. Qui connetto i punti di start e goal 
    % semplicemente al nodo piú vicino della mappa di voronoi.

    % Metto tutti i vertici in unico vettore v:
    % inserisco la "v" precedente cosi' che il nuovo "v" avra' il v' 
    % precedente piu' i "nuovi" ([vx(1,i) vy(1,i)] ; [vx(2,i) vy(2,i)])
    v = [];
    for i = 1 : length(vx)
        v = [v ; [vx(1,i) vy(1,i)] ; [vx(2,i) vy(2,i)]];
    end

    % Cerco quindi tra i vertici di v quello che é meno distante da start e
    % goal e unisco quest'ultimi al vettore v
    % diminuisco il vettore v rispettivamente delle coordinate di start e
    % goal cosi' da ottenere i vertici diminuiti da essi -> in questa
    % maniera potro' calcolare le distanze rispettivamente da start e goal
    vnormstart = v-[x_start y_start];
    vnormgoal = v-[x_goal y_goal];
    for i = 1 : size(v,1)
        % calcolo la norma rispetto al vettore vnormstar
        vnormstart(i,:) = norm(vnormstart(i,:));
        % calcolo la norma rispetto al vettore vnormgoal
        vnormgoal(i,:) = norm(vnormgoal(i,:));
    end
    % prendo la distanza minima rispettivamente dai vettori vnormstar e 
    % vnormgoal
    [min_dist_start,istart] = min(vnormstart);
    [min_dist_goal,igoal] = min(vnormgoal);
    vstart=v(istart(1),:); vgoal=v(igoal(1),:);

    vx = [vx  [x_start ; vstart(1)]  [x_goal ; vgoal(1)]];
    vy= [vy   [y_start ; vstart(2)]  [y_goal ; vgoal(2)]];
    v = [v ; [x_start y_start] ; [vstart(1) vstart(2)] ; [x_goal y_goal] ; [vgoal(1) vgoal(2)]];


    %% Plot della mappa finale

    subplot(1,3,2); plot(vx, vy, "g", "linewidth",2); hold on;
    plot2D(environment); title("VORONOI DIAGRAMS AFTER CLEANUP");

    
    %% Creazione grafo tramite matrice di adiacenza

    % Siccome in v la sequenza di segmenti é alla rinfusa, vertici 
    % adiacenti possono essere in posizioni molto diverse. Quindi, tramite 
    % find_zero_rows trovo vertici coincidenti in v. In seguito, si segue il 
    % principio che i vertici viaggiano a coppie in cui il primo vertice é 
    % di indice dispari e il secondo di indice pari.

    % definisco la matrice di adiacenza
    A = zeros(length(v));
    vtemp = v;
    
    for i = length(vtemp) : -1 : 1
        % diminuisco vtemp della riga i-esima di vtemp
        temp = (vtemp-vtemp(i,:));
        import path_planning.voronoi_diagram.find_zero_rows;
        occ = find_zero_rows(temp);
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

    G = graph(A, "lower");
    subplot(1,3,3); 
    plot(vx, vy, "g", "linewidth",2); 
    hold on; plot2D(environment);
    hold on; p = plot(G, "xdata",v(:,1), "ydata",v(:,2));
    path = shortestpath(G, length(v)-3, length(v)-1);
    % highlight the shortest path
    highlight(p, path, "EdgeColor","m", "LineWidth",7);
    title("VORONOI DIAGRAMS WITH ASSOCIATED GRAPH AND SHORTEST PATH");
    
    % salvo i vertici del grafo (quindi le loro coordinate x e y)
    % corrispondenti allo shortest path ottenuto -> questa sara' la
    % traiettoria minima composta da questo insieme di punti (vertici del 
    % grafo)
    trajectory = v(path, :);
    
end