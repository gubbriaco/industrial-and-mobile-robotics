function dist = euclidean_distance(A, B)
    
    % function che calcola la distanza tra due punti secondo il metodo 
    % euclideo

    [m,n] = size(A);
    if m==1
        dist = sqrt( (A(1)-B(1))^2 + (A(2)-B(2))^2 );
    else
        dist = sqrt( (A(1,1)-B(1,1))^2 + (A(2,1)-B(2,1))^2 );
    end
    
end

