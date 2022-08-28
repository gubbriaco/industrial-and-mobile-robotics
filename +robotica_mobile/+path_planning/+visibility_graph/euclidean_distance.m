%funzione che calcola la distanza tra due punti secondo il metodo euclideo
function dist = euclidean_distance(A, B)

    [m,n] = size(A);
    if m==1
        dist = sqrt( (A(1)-B(1))^2 + (A(2)-B(2))^2 );
    else
        dist = sqrt( (A(1,1)-B(1,1))^2 + (A(2,1)-B(2,1))^2 );
    end
    
end

