%funzione che si occupa della costruzione del grafo di visibilita'
function [ path, dist ] = graph_creation( start, goal, map, vertices_map, obstacles)
    
    import path_planning.visibility_graph.adjacency_matrix;
    %si costruisce la matrice di adiacenza 
    [M, V, W] = adjacency_matrix(start, goal, map, vertices_map);
    
    n=length(V); %gli ultimi due vertici di V sono Pstart e Pfinish
    
    %si generano tutti i percorsi possibili e tra questi si evidenzia il
    %cammino minimo
    [dist, path] = graphshortestpath(M, n-1, n, 'Directed',false, 'Weights',W);
    %il path contiene i vertici che compongono il cammino minimo
    
    figure();
    %plot di tutti i percorsi possibili
    k = 1:n;
    gplot(M(k,k), V(k,:), '-O')
    axis equal, axis([0 100 0 100]), xlabel('X'), ylabel('Y');
    title("VISIBILITY GRAPH");
    %plot del cammino minimo
    hold on; i=1:length(path); gplot(M(path(i), path(i)), V(path(i),:), 'R-d');
    %salvo il percorso minimo
    [pathx pathy] = gplot(M(path(i), path(i)), V(path(i),:));
    path = [pathx pathy];
    
    %plot ostacoli
    hold on;
    for j = 1 : size(obstacles)
        ob = obstacles(j,:);
        x_ob = ob(1);
        y_ob = ob(3);
        w_ob = ob(2)-ob(1);
        h_ob = ob(4)-ob(3);
        rectangle("position",[x_ob y_ob w_ob h_ob], "facecolor","r");
    end
    %plot start e goal
    hold on; plot(start(1), start(2), "ok", "linewidth",2);
    hold on; plot(goal(1), goal(2), "ok", "linewidth",2);

    
end

