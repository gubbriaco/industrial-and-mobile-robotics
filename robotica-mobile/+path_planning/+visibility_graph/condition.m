%funzione che si occupa della verifica di appartenenza di un generico
%punto all'ostacolo contraddistinto dalla figura del rettangolo
function contenuto = condition(x, y, vertices)

    
    % vertici(1,:) e' il vertice in ALTO SX del rettangolo  (X,Y)
    % le righe successive sono gli altri vertici in senso ANTIORARIO
    
    Xmin = vertices(1,1); Xmax = vertices(3,1);
    Ymin = vertices(2,2); Ymax = vertices(1,2);
    
    if x<Xmin || x>Xmax || y<Ymin || y>Ymax
        contenuto = -1;      % punto esterno
    elseif x>Xmin && x<Xmax && y>Ymin && y<Ymax
        contenuto = 1;       % punto interno
    else
        contenuto = 0;       % punto di frontiera
    end
    
end

