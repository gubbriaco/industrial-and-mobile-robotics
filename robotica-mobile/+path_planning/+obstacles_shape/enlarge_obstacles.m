import environment.Obstacle;

for i=1:length(obstacles)
    
    obstacle = obstacles(i);
    % l'ostacolo "allargato" sara' allargato partendo dalla x e la y di
    % inizio plot (@see obstacle.x, @see obstacle.y) e aumentando le
    % dimensioni w e h (@see obstacle.w, @see obstacle.h) di un offset 
    % (@see enlargement)
    % il tutto viene ottenuto considerando la funzione rectangle (che viene
    % richiamata nel plot dell'ostacolo) con una curvature 
    % (@see obstacle.curvature) pari a 0 cosi' da uniformare tutti gli
    % ostacoli alla forma di un rettangolo o quadrato (in base a x, y, w e 
    % h)
    enlarged_obstacle = Obstacle(obstacle.x-enlargement, obstacle.y-enlargement, obstacle.w+(2*enlargement), obstacle.h+(2*enlargement), 0);
    global width height
    for k=1:height
    	for j=1:width
            if k>=(obstacle.x-obstacle.h) && k<=obstacle.x && j>=(obstacle.y-obstacle.w) && j<=obstacle.y
            	environment.matrix(k,j)=999;
            end                 
    	end
    end
    enlarged_obstacles(i) = enlarged_obstacle;
    
end