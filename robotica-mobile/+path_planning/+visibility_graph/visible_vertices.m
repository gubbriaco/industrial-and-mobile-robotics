%funzione che si occupa di verificare se e' possibile tracciare una linea 
%di visibilita' tra i due vertici che si stanno considerando.
%Questo e' possibile se la linea non interseca nessuno degli ostacoli presenti sulla mappa
function bool = visible_vertices(Xi, Yi, Xf, Yf, map)

    delta=0.01;     % 1 cm

    import path_planning.visibility_graph.segment;
    [ x, y ] = segment( Xi, Yi, Xf, Yf, delta );

    % Mappa{1} contiene una matrice 4x2 con i vertici interni della mappa.
    % Mappa{1}(1,:) contiene il vertice (x,y) ALTO SX.
    % Seguono gli altri in senso ANTIORARIO

    intersect=0;
    i=2;
    while i<=length(map) && ~intersect

        vertici = map{i};

        import path_planning.visibility_graph.obstacle_intersection;
        intersect = obstacle_intersection( x, y, vertici );%rettangolo o quadrat
        

        i=i+1;
    end

    %risultato

    bool = ~intersect;

end

