function intersezione = obstacle_intersection( X, Y, vertices)
    
    % function che si occupa di verificare le intersezione con gli ostacoli
    % rettangolo e quadrati


    contenuto=-1; % contenuto==-1 ESTERNO
                  % contenuto==0 FROTIERA
                  % contenuto==1 INTERNO
    i=1;
    while i<=length(X) && contenuto~=1
        
        import path_planning.visibility_graph.condition;
        contenuto = condition( X(i), Y(i), vertices);
        
        i=i+1;
    end
    
    if contenuto==1
        intersezione=1;
    else
        intersezione=0;
    end
    

end

