classdef Environment
   
    properties
        width {mustBeFinite, mustBeNonnegative}
        height {mustBeFinite, mustBeNonnegative}
        matrix
    end
    
    methods
        %% COSTRUTTORE
        function environment = Environment(width, height)
            environment.width = width;
            environment.height = height;
        end
    end
    
    
    methods(Static)
        function plot()
            global width height
            x=0; y=0;
            title("ENVIRONMENT"); 
            rectangle('Position', [x y width height], "EdgeColor", "black", "LineWidth", 1);
            xlim_target = 300; ylim_target = 150;
            xlim([width-xlim_target xlim_target]); ylim([height-ylim_target ylim_target]);
        end
       
        
        function add_obstacle(x_obstacle, y_obstacle, w_obstacle, h_obstacle, curvature)
            global width height matrix
            
            for i=1:height
                for j=1:width
                    
                    hold on; rectangle('Position', [x_obstacle y_obstacle w_obstacle h_obstacle], "Curvature", curvature, "FaceColor", "black", "EdgeColor", "black");
                    if isequal(i, x_obstacle) && isequal(j, y_obstacle)
                        for x=height:h_obstacle
                            for y=width:w_obstacle
                                matrix(x,y)=Inf;
                            end
                        end
                    end
                        
                end
            end
            
        end
        
        
    end
    
end

