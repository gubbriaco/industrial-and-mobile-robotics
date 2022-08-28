function P_reduced = reduce_points(P)

    P_reduced = [];
    
    for i = 1 : 2 : length(P)
        P_reduced = [P_reduced ; P(i)];
    end

end