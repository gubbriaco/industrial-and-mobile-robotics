%funzione che costruisce la matrice di adiacenza che rappresenta il grafo di visibilita'
function [M, V, W] = adjacency_matrix(start, goal, map, vertices_map)
    
    %Aggiungiamo alla mappa dei vertici Ppartenza Pfine
    start_goal = [start; goal];
    vertices_map{length(vertices_map)+1} = start_goal;
    
    %numero di vertici
    n=0;
    for i = 1:length(vertices_map)
       n = n+length(vertices_map{i});
    end
    
    %raccolgo tutti i vertici in un unica matrice nx2
    V=zeros(n,2); r=1;
    for i = 1:length(vertices_map)
       for j = 1:length(vertices_map{i})
            V(r,:) = vertices_map{i}(j,:);
            r = r+1;
       end
    end
    
    M = zeros(n,n);
    rig=[]; col=[];%righe,colonne
    W = []; % pesi
    for i = 1:length(V)-1
        for j = i+1:length(V)
            import path_planning.visibility_graph.visible_vertices;
            %bool = verticiVisibili( Xs, Ys, Xf, Yf, Map )
            if visible_vertices( V(i,1), V(i,2), V(j,1), V(j,2), map)==1  
                rig = [rig, j];
                col = [col, i]; 
                import path_planning.visibility_graph.euclidean_distance;
                W = [ W; euclidean_distance(V(i,:),V(j,:)) ];
            end
        end
    end
    
    M = sparse(rig, col, W, n, n);
    
end
