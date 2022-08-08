%funzione 'poll'
function  [r, c, queue] = poll( queue )


    % queue e' una matrice nx2 dove ogni riga 
    % e' una coordinata (riga,colonna)

    r=[]; c=[];
    m = size(queue);
    if m >= 1
        r = queue(1,1);
        c = queue(1,2);
    end
    
    if m>1
        queue=queue(2:end,:);
    else   
        queue=[];
    end
    
end

