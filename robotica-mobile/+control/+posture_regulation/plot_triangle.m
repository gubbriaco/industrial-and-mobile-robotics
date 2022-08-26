function triangle = plot_triangle(center, angle)

    scale = 1.5;
    angle = pi/2 - atan2(sin(angle),cos(angle));
    center = center(:); %column vector

    %Coordinate del triangolo
    coordinates = [cos(angle) sin(angle) ; -sin(angle) cos(angle)] * [0 1 -1 ; 1 -1 -1]*scale + center;

    triangle = plot(polyshape(coordinates(1,:),coordinates(2,:)), ...
                                           "LineWidth",2, "FaceColor","r");

    

end