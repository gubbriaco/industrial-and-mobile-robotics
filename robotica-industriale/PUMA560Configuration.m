classdef PUMA560Configuration

    properties
        link1 {mustBeFinite, mustBeReal}
        link2 {mustBeFinite, mustBeReal}
        link3 {mustBeFinite, mustBeReal}
        
        alpha1 {mustBeReal}
        alpha2 {mustBeReal}
        alpha3 {mustBeReal}
        
        d1 {mustBeFinite, mustBeReal}
        d2 {mustBeFinite, mustBeReal}
        d3 {mustBeFinite, mustBeReal}
        
        theta1 {mustBeReal}
        theta2 {mustBeReal}
        theta3 {mustBeReal}
    end
    
    properties (Access=private)
        R0b(4,4)
    end
    
    properties (Constant)
        revolute = 0;
        prismatic = 1;
    end
    
    properties
        LINK1
        LINK2
        LINK3
    end
    
    %% COSTRUTTORE
    methods
        function robot = PUMA560Configuration(links, alphas, ds, thetas, R0b)
            robot.link1 = links(1);
            robot.link2 = links(2);
            robot.link3 = links(3);
            
            robot.alpha1 = alphas(1);
            robot.alpha2 = alphas(2);
            robot.alpha3 = alphas(3);
            
            robot.d1 = ds(1);
            robot.d2 = ds(2);
            robot.d3 = ds(3);
            
            robot.theta1 = thetas(1);
            robot.theta2 = thetas(2);
            robot.theta3 = thetas(3);
            
            for i=1:4
                for j=1:4
                    robot.R0b(i,j) = R0b(i,j);
                end
            end
        end 
    end
    
end