%funzione 'offer'
function queue = offer( R, C, queue )
    
    [m,n] = size(queue);
    queue(m+1,1) = R;
    queue(m+1,2) = C;
    
end

