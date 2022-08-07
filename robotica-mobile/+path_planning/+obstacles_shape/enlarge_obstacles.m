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
    for s=1:height
        for j=1:width
            if isequal(s, abs(obstacle.y-obstacle.h)) && isequal(j, abs(obstacle.x-obstacle.w))
                for n=s:obstacle.y
                    for m=j:(obstacle.x+obstacle.w)
                        environment.matrix(n,m)=999;
                    end
                end
            end
        end
    end
    enlarged_obstacles(i) = enlarged_obstacle;
    
end