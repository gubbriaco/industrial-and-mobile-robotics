function P_cleanedup = cleanup(P)
    
    % Ripulisco la traiettoria ottenuta con la tecnica di path planning
    % 'visibility graph'. Tale traiettoria presenta valori uguali in
    % istanti successivi ed, inoltre, valori pari a Nan che rendono
    % difficoltosa la gestione dei successivi calcoli. Pertanto, essendo
    % non utili ai fini del calcolo e dello studio successivo, ripulisco la
    % traiettoria ottenuta con i 'visibility graphs'.
    
    
    Px = P(:,1);
    Py = P(:,2);
    
    %% removal of equal values
    Px_unique = unique(Px);
    Py_unique = unique(Py);
    
    %% removal of Nan values
    Px_withoutNan = Px_unique(~isnan(Px_unique));
    Py_withoutNan = Py_unique(~isnan(Py_unique));
    
    %%
    P_cleanedup = [Px_withoutNan  Py_withoutNan];

end