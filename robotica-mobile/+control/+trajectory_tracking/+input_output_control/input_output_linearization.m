function xdot = input_output_linearization(xstar, x, xdotstar, ystar, y, ydotstar, theta)

    b = 0.5;
    Kx = 1;
    Ky = 1;                                
    
    xB = x + b*cos(theta);
    yB = y + b*sin(theta);
    
    xBdotstar = xdotstar;
    yBdotstar = ydotstar;
    
    ux = xBdotstar + Kx*(xstar-xB);
    uy = yBdotstar + Ky*(ystar-yB);

    
    T = [cos(theta) -b*sin(theta);
         sin(theta) b*cos(theta)];
    
    detT = (T(1,1)*T(2,2)) - (T(1,2)*T(2,1));
    cofT11 = T(2,2);
    cofT12 = -T(2,1);
    cofT21 = -T(1,2);
    cofT22 = T(1,1);
    cofT = [cofT11 cofT21;cofT12 cofT22];
    invT = (1/detT) * cofT;
    
    vw = invT * [ux;uy];
    v = vw(1);
    w = vw(2);
    
    xdot = [v.*cos(theta) ; v.*sin(theta) ; w];
     
end