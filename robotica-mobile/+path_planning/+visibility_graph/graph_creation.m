function [ path, dist ] = graph_creation( start, goal, map, vertices_map)

    % function che si occupa della costruzione del grafo di visibilita'

    import path_planning.visibility_graph.adjacency_matrix;
    % si costruisce la matrice di adiacenza 
    [M, V, W] = adjacency_matrix(start, goal, map, vertices_map);
    
    n=length(V); % gli ultimi due vertici di V sono Pstart e Pfinish
    
    % si generano tutti i percorsi possibili e tra questi si evidenzia il
    % cammino minimo
    [dist, path] = graphshortestpath(M, n-1, n, 'Directed',false, 'Weights',W);
    %il path contiene i vertici che compongono il cammino minimo
    
    figure();
    % plot di tutti i percorsi possibili
    k = 1:n;
    gplot(M(k,k), V(k,:), '-O')
    axis equal, axis([0 100 0 100]), xlabel('X'), ylabel('Y');
    title("VISIBILITY GRAPH");
    % plot del cammino minimo
    hold on; i=1:length(path); gplot(M(path(i), path(i)), V(path(i),:), 'R-d');
    % salvo il percorso minimo
    [pathx pathy] = gplot(M(path(i), path(i)), V(path(i),:));
    path = [pathx pathy];
    
    global environment
    import environment.Environment;
    plot2D(environment);

    
end

