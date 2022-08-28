 function route = gradient_based_planner (f, start_coords, end_coords, max_its)
    % GradientBasedPlanner : This function plans a path through a 2D
    % environment from a start to a destination based on the gradient of the
    % function f which is passed in as a 2D array. The two arguments
    % start_coords and end_coords denote the coordinates of the start and end
    % positions respectively in the array while max_its indicates an upper
    % bound on the number of iterations that the system can use before giving
    % up.
    % The output, route, is an array with 2 columns and n rows where the rows
    % correspond to the coordinates of the robot as it moves along the route.
    % The first column corresponds to the x coordinate and the second to the 
    % y coordinate

    % calcolo l'anti-gradiente
    % [FX,FY] = gradient(F) returns the x and y components of the 
    % two-dimensional numerical gradient of matrix F. 
    % FX = gradient(F) returns the one-dimensional numerical gradient of 
    % vector F. The output FX corresponds to ∂F/∂x, which are the 
    % differences in the x (horizontal) direction. The additional output
    % FY corresponds to ∂F/∂y, which are the differences in the y 
    % (vertical) direction. The spacing between points in each direction 
    % is assumed to be 1.
    [gx, gy] = gradient (-f);
    

    route=start_coords;
    Point_on_route=start_coords;
    Speed=3; %un valore grande permette di arrivare velocemente al goal ma 
    % può determinare anche per esempio degli overshoot
    Tolerance=1; %è una misura della soglia, se è troppo piccola è accurata
    % ma la soluzione è lenta

    while(max_its > 0)
        % controllo il robot e' arrivato al goal
        if(norm(end_coords-Point_on_route) < Tolerance)
            % interrompo il ciclo perche' il robot e' arrivato
            break;
        end
        % 
        % equivalente a scrivere:
        % delta_x = gx(floor(Point_on_route));
        % delta_y = gy(floor(Point_on_route));
        delta_x = gx(floor(Point_on_route(2)), floor(Point_on_route(1)));
        delta_y = gy(floor(Point_on_route(2)), floor(Point_on_route(1)));
        % delta è un vettore sia di valore che direzione
        delta=[delta_x, delta_y];
        % otteniamo la direzione
        % un numero minore di 1 che sarà o con il segno meno o con il più
        % delta_direction = delta/norm(delta) =
        % = delta/sqrt(delta^2) = delta/delta -> positive or negative one
        % -> direction
        % il denominatore sara' sempre positivo perche' e' sotto radice 
        % mentre il numeratore potrebbe essere negativo.
        %
        % delta_direction_x = delta_x/norm(delta) = 
        % = delta_x/sqrt(delta_x^2+delta_y^2) < 1
        delta_direction_x = delta_x/norm(delta); 
        % delta_direction_y = delta_y/norm(delta) = 
        % = delta_y/sqrt(delta_x^2+delta_y^2) < 1
        delta_direction_y = delta_y/norm(delta);

        % new_point = previous_point + d/dt(previuos_point)*delta_shift
        new_route_x = Point_on_route(1)+Speed*delta_direction_x;
        new_route_y = Point_on_route(2)+Speed*delta_direction_y;

        % new_point
        Point_on_route = [new_route_x, new_route_y];

        % concateno il cammino precedente con il nuovo punto trovato
        route = [route; Point_on_route];
        
        % decremento il numero delle iterazioni da eseguire
        max_its=max_its-1;

    end








    % route = [start_coords];

    % for i=1:max_its
    %     current_point = route(end,:);
    %      if sum( abs(current_point-end_coords) ) < 5.0
    %          disp('Reached the goal !');
    %          break
    %      end
    %     ix = round( current_point(2) ); % X and Y axis are swaped
    %     iy = round( current_point(1) );
    %     w = 10;
    %     vx = mean( mean( gx(ix-w/2:ix+w/2, iy-w/2:iy+w/2) ) );
    %     vy = mean( mean( gy(ix-w/2:ix+w/2, iy-w/2:iy+w/2) ) );
    %     dt = 1 / norm([vx, vy]);
    %     next_point = current_point + dt*[vx, vy];
    %     route = vertcat(route, next_point);
    % end

    % figure
    % plot (route(:,1), route(:,2), 'r', 'LineWidth', 2);
    % grid on

    % *******************************************************************
end
