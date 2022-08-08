%funzione che si occupa dell'inserimento dell'ostacolo rettangolo sulla
%mappa
function map = rectangle_insertion( x, y, b, h, map, delta )

%% controllo
    [m,n] = size(map);
    
    if x<1 || x>n 
        error('coordinata X di inserimento al di fuori della matrice');
    end
    if y<1 || y>m
        error('coordinata Y di inserimento al di fuori della matrice');
    end
    
    Xi=x; Xf=x+b-1;
    Yi=y; Yf=y+h-1;
    
    if Xf > n       
        error('il rettangolo/quadrato e'' troppo largo per il punto di inserimento selezionato.');
    end
    if Yf < 1
        error('il rettangolo/quadrato e''troppo alto per il punto di inserimento selezionato.');
    end
    
%% inserimento
    
       map(Yi:Yf, Xi:Xf)=inf;
    
%% ingrossamento
   
    % lato superiore
    if Yi > delta+1
       map( Yi-1:-1:Yi-delta , Xi:Xf ) = inf;
       if Xi>1
           map( Yi-1:-1:Yi-delta , Xi-1 ) = inf;
       end
       if Xf < n
           map( Yi-1:-1:Yi-delta , Xf+1 ) = inf;
       end
    end
    
    % lato destro
    if Xf < n-delta
        map( Yi:Yf, Xf+1:Xf+delta ) = inf;
        if Yi>1
            map( Yi-1, Xf+1:Xf+delta ) = inf;
        end
        if Yf<m
            map( Yf+1, Xf+1:Xf+delta ) = inf;
        end
    end
    
    % lato inferiore
    if Yf < m-delta
        map( Yf+1:Yf+delta, Xi:Xf ) = inf;
        if Xi>1
            map( Yf+1:Yf+delta, Xi-1 ) = inf;
        end
        if Xf<n
             map( Yf+1:Yf+delta, Xf+1 ) = inf;
        end
     end
    
    %lato sinistro
    if Xi > delta+1
        map( Yi:Yf, Xi-1:-1:Xi-delta ) = inf;
        if Yi>1
            map( Yi-1, Xi-1:-1:Xi-delta ) = inf;
        end
        if Yf<m
            map( Yf+1, Xi-1:-1:Xi-delta ) = inf;
        end
    end
    
        
end
