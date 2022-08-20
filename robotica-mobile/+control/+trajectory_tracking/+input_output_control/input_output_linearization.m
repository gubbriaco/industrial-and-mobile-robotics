function [v,w] = input_output_linearization( xstar, xdotstar, x, ...
                                             ystar, ydotstar, y, ...
                                             theta, thetastar, ...
                                             vstar, omegastar)

    b = 0.5;
    Kx = 1;
    Ky = 1;                                
    
    xBdotstar = xdotstar;
    yBdotstar = ydotstar;
    
    ux = xBdotstar + Kx*(xstar-xB);
    uy = yBdotstar + Ky*(ystar-yB);

    T = [cos(theta) -b*sin(theta);
         sin(theta) b*cos(theta)];
    invT = inv(T);
    
    vw = invT * [ux;uy];
    v = vw(1);
    w = vw(2);
    
end