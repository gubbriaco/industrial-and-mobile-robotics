classdef Environment
   % - width e' la larghezza dell'ambiente
   % - heigth e' l'altezza dell'ambiente
   % - matrix e' la matrice che rappresenta "numericamente" l'ambiente, 
   % - dove i valori pari a zero corrispondono ad una porzione di ambiente
   %   "libera" mentre i valori diversi da zero rappresentano gli ostacoli
    properties
        width {mustBeFinite, mustBeNonnegative}
        height {mustBeFinite, mustBeNonnegative}
        matrix (125,275)
    end
    
    
    methods  
        function environment = Environment(width, height)
            environment.width = width;
            environment.height = height;
            environment.matrix = zeros(height, width);
        end
    end
    
    
    methods
        
        function m = get_matrix_environment(environment)
            m = environment.matrix;
        end
        
        function ob = get_obstacle(environment, pos)
            ob = environment.obstacles(pos);
        end
        
        function add_obstacle(environment, obstacle)
            global width height
            for i=1:height
                for j=1:width
                    if isequal(i, abs(obstacle.y-obstacle.h)) && isequal(j, abs(obstacle.x-obstacle.w))
                        for n=i:obstacle.y
                            for m=j:(obstacle.x+obstacle.w)
                                environment.matrix(n,m)=999;
                            end
                        end
                    end
                end
            end
        end
        
        function plot(~, plot_title)
            global width height start goal
            x=0; y=0;
            title(plot_title);
            rectangle('Position',[x y width height], "EdgeColor","black", "LineWidth",1);
            xlim_target = 300; ylim_target = 150;
            xlim([width-xlim_target xlim_target]); ylim([height-ylim_target ylim_target]);
            hold on; plot(start(1), start(2), "*", "LineWidth",4, "Color","#124ee6");
            hold on; plot(goal(1), goal(2), "*", "LineWidth", 4, "Color","#0eb04f"); 
        end
         
    end
        
    
end

