function [v,w] = input_output_linearization(xstar, x, xdotstar, ystar, y, ydotstar, theta)

    b = 0.5;
    Kx = 1;
    Ky = 1;                                
    
    xB = x + b*cos(theta);
    yB = y + b*sin(theta);
    
    xBdotstar = xdotstar;
    yBdotstar = ydotstar;
    
    ux = xBdotstar + Kx*(xstar-xB);
    uy = yBdotstar + Ky*(ystar-yB);

    T = [cos(theta) -b*sin(theta);sin(theta) b*cos(theta)];
    invT = inv(T);
    
    vw = invT * [ux;uy];
    v = vw(1);
    w = vw(2);
    
end