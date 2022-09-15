 function route = gradient_based_planner (f, start_coords, end_coords, max_its)
    % In tale function viene pianificato un percorso attraverso un ambiente
    % 2D partendo da una posizione di start fino ad una posizione di goal
    % considerando il gradiente della funzione f che viene passata come 
    % matrice. I due argomenti start_coords ed end_coords denotano le 
    % coordinate dell'inizio e della fine rispettivamente di posizioni 
    % nell'array mentre max_its indica il numero massimo di iterazioni che 
    % il sistema può utilizzare prima di terminare.
    % L'output, route, è un array con 2 colonne e n righe in cui le righe
    % corrispondono alle coordinate del robot mentre si muove lungo il 
    % percorso. La prima colonna corrisponde alla coordinata x e la seconda
    % alla coordinata y.

    % calcolo l'anti-gradiente
    % [FX,FY] = gradiente(F) restituisce le componenti x e y del gradiente 
    % numerico bidimensionale della matrice F. 
    % FX = gradiente(F) restituisce il gradiente numerico unidimensionale 
    % del vettore F. L'output FX corrisponde a ∂F/∂x, che sono le 
    % differenze nella direzione x (orizzontale). L'uscita aggiuntiva FY 
    % corrisponde a ∂F/∂y, che sono le differenze nella direzione y 
    % (verticale). La spaziatura tra i punti in ciascuna direzione si
    % presume che sia 1.
    [gx, gy] = gradient (-f);
    
 
    route = start_coords;
    point_on_route = start_coords;
    % un valore grande permette di arrivare velocemente al goal ma può 
    % determinare anche per esempio degli overshoot
    speed = 3; 
    %è una misura della soglia: se è troppo piccola è accurata ma la 
    % soluzione è lenta
    tolerance=1; 

    
    while( max_its > 0 )
        
        % controllo che il robot sia arrivato in un intorno del goal
        if(norm(end_coords-point_on_route) < tolerance)
            % interrompo il ciclo perche' il robot e' arrivato nell'intorno
            % del goal
            break;
        end
        
        % equivalente a scrivere:
        % delta_x = gx(floor(Point_on_route));
        % delta_y = gy(floor(Point_on_route));
        delta_x = gx(floor(point_on_route(2)), floor(point_on_route(1)));
        delta_y = gy(floor(point_on_route(2)), floor(point_on_route(1)));
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
        new_route_x = point_on_route(1)+speed*delta_direction_x;
        new_route_y = point_on_route(2)+speed*delta_direction_y;

        % new_point
        point_on_route = [new_route_x, new_route_y];

        % concateno il cammino precedente con il nuovo punto trovato
        route = [route; point_on_route];
        
        % decremento il numero delle iterazioni da eseguire
        max_its=max_its-1;

    end

    
end
