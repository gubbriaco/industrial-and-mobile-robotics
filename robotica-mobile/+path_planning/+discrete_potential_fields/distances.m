%funzione 'distanze'
function  map = distances( Xstar, Ystar, map )
%UNTITLED4 Summary of this function goes here
%   Detailed explanation goes here

    [m,n] = size(map);
    if (Xstar < 1) || (Xstar > n)
        error('coordinata X di arrivo fuori dalla mappa ');
    end
    if (Ystar < 1) || (Ystar > m)
        error('coordinata Y di arrivo fuori dalla mappa ');
    end
    
    import path_planning.discrete_potential_fields.BFS;
    map = BFS(Xstar, Ystar, map);

end
