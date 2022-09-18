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
        [riga, colonna, queue] = poll(queue);            % estrazione del primo elemento
        import path_planning.discrete_potential_fields.find_neighbours;
        neighbours = find_neighbours(riga,colonna,map);   % neighbours matrice mx2 con le coppie (riga,col) dei vicini
        
        for i=1:length(neighbours)
            
            riga_neigh = neighbours(i,1);
            colonna_neigh = neighbours(i,2);
            
            if ( colonna_neigh~=Xstart || riga_neigh~=Ystart ) && map( riga_neigh, colonna_neigh) == 0
                
                map( riga_neigh, colonna_neigh ) = map( riga, colonna ) + 1;        % assegna potenziale
                import path_planning.discrete_potential_fields.offer; 
                queue = offer( riga_neigh, colonna_neigh, queue );         % aggiungi alla coda
            end
        end
                
    end
    
end
