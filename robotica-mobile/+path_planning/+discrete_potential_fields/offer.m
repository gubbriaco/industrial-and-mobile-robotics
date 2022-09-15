%funzione 'offer'
function queue = offer( riga, colonna, queue )
    
    [m,n] = size(queue);
    queue(m+1,1) = riga;
    queue(m+1,2) = colonna;
    
end

