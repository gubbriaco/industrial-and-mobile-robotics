classdef Robot
   
    properties
        radius {mustBeFinite, mustBeNonnegative}
    end
   
    methods
        %% COSTRUTTORE
        function robot = Robot(radius)
            robot.radius = radius;
        end
    end
    
    
    methods(Static)
        function plot()
            global radius_robot;
            % le coordinate in cui la rectangle function iniziera' a
            % plottare il cerchio
            x=1; y=1;
            title("ROBOT");
            % le coordinate del centro saranno pari alla somma tra le 
            % coordinate in cui ha iniziato a plottare il cerchio e il
            % raggio del cerchio stesso
            xc=x+radius_robot; yc=y;
            
            % curvature che ci servira' per plottare i rettangoli
            % "smussati" (tipo come delle "ruote")
            curvature=0.2;
            % width ed height del rettangolo sinistro
            w1=2; h1=6;
            % coordinate per disegnare il rettangolo sinistro
            xr1=xc-radius_robot; yr1=yc+h1/3;
            hold on; rectangle('Position', [xr1 yr1 w1 h1] ,'Curvature', curvature, "FaceColor", "red", "EdgeColor", "red", "LineWidth", 1);
            
            % width ed height del rettangolo destro
            w2=w1; h2=h1;
            % coordinate per disegnare il rettangolo destro
            xr2=xc+radius_robot-w2;  yr2=yc+h2/3;
            hold on; rectangle('Position', [xr2 yr2 w2 h2] ,'Curvature', curvature, "FaceColor", "red", "EdgeColor", "red", "LineWidth", 1);
            
            hold on; rectangle("Position", [x y 2*radius_robot 2*radius_robot], "Curvature", [1,1], "FaceColor", "black");
            grid; axis equal;
        end
    end
    
end

