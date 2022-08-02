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
            environment.matrix = zeros(height, width);
           
        end
    end
    
    
    methods(Static)
        function plot()
            global width height
            x=0; y=0;
            title("ENVIRONMENT"); 
            rectangle('Position', [x y width height], "EdgeColor", "black", "LineWidth", 1);
            xlim_target = 1400; ylim_target = 800;
            xlim([width-xlim_target xlim_target]); ylim([height-ylim_target ylim_target]);
        end
       
        
        function add_obstacles()
            global width height
            
            for i=1:height
                for j=1:width
                    
                    global x_obstacleNR1 y_obstacleNR1 w_obstacleNR1 h_obstacleNR1
                    x_obstacleNR1=0; y_obstacleNR1=0; w_obstacleNR1=0; h_obstacleNR1=0;
                    hold on; rectangle('Position', [x_obstacleNR1 y_obstacleNR1 w_obstacleNR1 h_obstacleNR1], "Curvature", 0.4, "FaceColor", "black", "EdgeColor", "black");
                    if isequal(i, x_obstacleNR1) & isequal(j, y_obstacleNR1)
                        for x1=height:h_obstacleNR1
                            for y1=width:w_obstacleNR1
                                matrix(x1,y1)=Inf;
                            end
                        end
                    end
                        
                    global x_obstacleNR2 y_obstacleNR2 w_obstacleNR2 h_obstacleNR2 
                    x_obstacleNR2=0; y_obstacleNR2=0; w_obstacleNR2=0; h_obstacleNR2=0;
                    hold on; rectangle('Position', [x_obstacleNR2 y_obstacleNR2 w_obstacleNR2 h_obstacleNR2], "Curvature", 0.4, "FaceColor", "black", "EdgeColor", "black");     
                    if isequal(i, x_obstacleNR2) & isequal(j, y_obstacleNR2)
                         for x2=height:h_obstacleNR2
                            for y2=width:w_obstacleNR2
                                matrix(x2,y2)=Inf;
                            end
                        end
                    end
                        
                    global x_obstacleNR3 y_obstacleNR3 w_obstacleNR3 h_obstacleNR3 
                    x_obstacleNR3=0; y_obstacleNR3=0; w_obstacleNR3=0; h_obstacleNR3=0;
                    hold on; rectangle('Position', [x_obstacleNR3 y_obstacleNR3 w_obstacleNR3 h_obstacleNR3], "Curvature", 0.4, "FaceColor", "black", "EdgeColor", "black");
                    if isequal(i, x_obstacleNR3) & isequal(j, y_obstacleNR3)
                         for x3=height:h_obstacleNR3
                            for y3=width:w_obstacleNR3
                                matrix(x3,y3)=Inf;
                            end
                        end
                    end
                        
                    global x_obstacleNR4 y_obstacleNR4 w_obstacleNR4 h_obstacleNR4 
                    x_obstacleNR4=0; y_obstacleNR4=0; w_obstacleNR4=0; h_obstacleNR4=0;
                    hold on; rectangle('Position', [x_obstacleNR4 y_obstacleNR4 w_obstacleNR4 h_obstacleNR4], "Curvature", 0.4, "FaceColor", "black", "EdgeColor", "black");
                    if isequal(i, x_obstacleNR4) & isequal(j, y_obstacleNR4)
                         for x4=height:h_obstacleNR4
                            for y4=width:w_obstacleNR4
                                matrix(x4,y4)=Inf;
                            end
                        end
                    end
                        
                    global x_obstacleNR5 y_obstacleNR5 w_obstacleNR5 h_obstacleNR5 
                    x_obstacleNR5=0; y_obstacleNR5=0; w_obstacleNR5=0; h_obstacleNR5=0;
                    hold on; rectangle('Position', [x_obstacleNR5 y_obstacleNR5 w_obstacleNR5 h_obstacleNR5], "Curvature", 0.4, "FaceColor", "black", "EdgeColor", "black");
                    if isequal(i, x_obstacleNR5) & isequal(j, y_obstacleNR5)
                         for x5=height:h_obstacleNR5
                            for y5=width:w_obstacleNR5
                                matrix(x5,y5)=Inf;
                            end
                        end
                    end
                        
                    global x_obstacleNR6 y_obstacleNR6 w_obstacleNR6 h_obstacleNR6 
                    x_obstacleNR6=0; y_obstacleNR6=0; w_obstacleNR6=0; h_obstacleNR6=0;
                    hold on; rectangle('Position', [x_obstacleNR6 y_obstacleNR6 w_obstacleNR6 h_obstacleNR6], "Curvature", 0.4, "FaceColor", "black", "EdgeColor", "black");
                    if isequal(i, x_obstacleNR6) & isequal(j, y_obstacleNR6)
                         for x6=height:h_obstacleNR6
                            for y6=width:w_obstacleNR6
                                matrix(x6,y6)=Inf;
                            end
                        end
                    end
                        
                    end
            end
  
        end
        
        
    end
    
end

