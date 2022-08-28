%funzione 'BFS'
function map = BFS( Xstart, Ystart, map )
   
    % Coordinata X ---> colonne della matrice map
    % Coordinata Y ---> righe della matrice map

    % coda FIFO: una coppia di coordinate (Y,X) (riga,colonna) per ogni riga
    % queue(1,:) First In
    queue=[];
    
    % inserimento del punto di partenza
    queue(1,1) = Ystart;
    queue(1,2) = Xstart;

    while numel(queue) ~= 0                     % coda non vuota
    
        import path_planning.discrete_potential_fields.poll;
        [R, C, queue] = poll(queue);            % estrazione del primo elemento
        import path_planning.discrete_potential_fields.find_neighbours;
        neighbours = find_neighbours(R,C,map);   % neighbours matrice mx2 con le coppie (riga,col) dei vicini
        
        for i=1:length(neighbours)
            
            R_neigh = neighbours(i,1);
            C_neigh = neighbours(i,2);
            
            if ( C_neigh~=Xstart || R_neigh~=Ystart ) && map( R_neigh, C_neigh) == 0
                
                map( R_neigh, C_neigh ) = map( R, C ) + 1;        % assegna potenziale
                import path_planning.discrete_potential_fields.offer; 
                queue = offer( R_neigh, C_neigh, queue );         % aggiungi alla coda
            end
        end
                
    end
    
end
