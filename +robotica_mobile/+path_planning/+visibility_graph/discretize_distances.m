function P_discretized = discretize_distances(P, nr_samples)

    P_discretized = [];

    for i = 1 : length(P)
        if i < length(P)
            xi = P(i,1);  xf = P(i+1,1);
            yi = P(i,2);  yf = P(i+1,2);
            
            x_points = [xi xf];
            y_points = [yi yf];
            
            points = [x_points ; y_points];
            [xy, qd, qdd] = trapveltraj(points, nr_samples);
            
            newpoints = [xy(1,:)' xy(2,:)'];
            P_discretized = [P_discretized ; newpoints];
        end
    end

end