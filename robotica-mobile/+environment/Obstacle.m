classdef Obstacle
    %OBSTACLE Summary of this class goes here
    %   Detailed explanation goes here
    
    properties
        x {mustBeFinite, mustBeNonnegative}
        y {mustBeFinite, mustBeNonnegative}
        w {mustBeFinite, mustBeNonnegative}
        h {mustBeFinite, mustBeNonnegative}
        curvature {mustBeFinite, mustBeNonnegative}
    end
    
    methods
        function obstacle = Obstacle(x, y, w, h, curvature)
            obstacle.x = x;
            obstacle.y = y;
            obstacle.w = w;
            obstacle.h = h;
            obstacle.curvature = curvature;
        end
        
        
        function plot(obstacle, color)
             hold on; rectangle('Position',[obstacle.x obstacle.y obstacle.w obstacle.h], "Curvature",obstacle.curvature, "FaceColor",color, "EdgeColor",color);
        end
        
        
    end
end
