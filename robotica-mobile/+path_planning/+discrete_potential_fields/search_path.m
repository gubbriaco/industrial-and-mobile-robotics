%funzione che si occupa di determinare il cammino minimo a partire dalla 
%mappa dei potenziali discreti tramite un algoritmo greedy
function [cell_path, path_map] = search_path( Xstart, Ystart, distance_map )

    % controllo input

    [m,n] = size(distance_map);
    if (Xstart < 1) || (Xstart > n)
        error('coordinata X di arrivo fuori dalla mappa ');
    end
    if (Ystart < 1) || (Ystart > m)
        error('coordinata Y di arrivo fuori dalla mappa ');
    end
    if distance_map( Ystart, Xstart) == inf
        error('posizione iniziale collocata su un ostacolo');
    end
   
    % ricerca percorso
    path = [ Xstart, Ystart ];
    found_destination=0; 
    r = 2;
    while ~found_destination
        
        [found_low, path]=find_lower(distance_map, path(r-1,2), path(r-1,1), r, path );
        
        if ~found_low
            path = find_equal(distance_map, path(r-1,2), path(r-1,1), r, path );
        elseif distance_map( path(r,2), path(r,1) ) == 0
            found_destination=1;
        end
        
        r=r+1;
    end
    
    % path cartesiano
    cell_path=zeros(length(path),2);
    cell_path(:,1) = path(:,1);
    cell_path(:,2) = path(:,2);
    
    
    % disegna percorso
    for r = 1:length(path)
        distance_map(path(r,2),path(r,1))= -1111;
    end
    path_map=distance_map;
    
end
