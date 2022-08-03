classdef Environment
   
    properties
        width {mustBeFinite, mustBeNonnegative}
        height {mustBeFinite, mustBeNonnegative}
        
    end
    
    
    methods  
        function environment = Environment(width, height)
            environment.width = width;
            environment.height = height;
        end
    end
    
    
    methods(Static)
       
    end
    
    methods
        function m = add_obstacle(~, matrix, x_obstacle, y_obstacle, w_obstacle, h_obstacle)
            global width height
            for i=1:height
                for j=1:width
                    if i>=x_obstacle && i<=(x_obstacle+w_obstacle) && j>=y_obstacle && j<=(y_obstacle+h_obstacle)
                        matrix(i,j)=999;
                    end                 
                end
            end
            m = matrix;
        end
        
        function plot_obstacle(~, x_obstacle, y_obstacle, w_obstacle, h_obstacle, curvature)
            hold on; rectangle('Position',[x_obstacle y_obstacle w_obstacle h_obstacle], "Curvature",curvature, "FaceColor","black", "EdgeColor","black");
        end
        
        function add_point(~, point)
            hold on; plot(point(1), point(2), "*", "LineWidth", 4);
        end
        
        function plot(~)
            global width height
            x=0; y=0;
            title("ENVIRONMENT");
            rectangle('Position',[x y width height], "EdgeColor","black", "LineWidth",1);
            xlim_target = 300; ylim_target = 150;
            xlim([width-xlim_target xlim_target]); ylim([height-ylim_target ylim_target]);
        end
         
    end
        
    
end

