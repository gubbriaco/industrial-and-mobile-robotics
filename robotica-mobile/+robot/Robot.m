classdef Robot
   
    properties
        radius {mustBeFinite, mustBeNonnegative}
    end
   
    methods
        function robot = Robot(radius)
            robot.radius = radius;
        end
  
        function plot(~)
            global radius_robot;
            % le coordinate in cui la rectangle function iniziera' a
            % plottare il cerchio
            x=1; y=1;
            title("ROBOT");
            hold on; rectangle("Position",...
                [x y 2*radius_robot 2*radius_robot], "Curvature",[1,1],...
                "FaceColor", "black");
            axis equal;
        end
    end
    
end

