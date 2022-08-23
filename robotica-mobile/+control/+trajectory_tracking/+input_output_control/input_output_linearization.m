function xdot = input_output_linearization(Ts, Xg, xstar, xdotstar, ystar, ydotstar)

    x = Xg(1);
    y = Xg(2);
    theta = Xg(3);

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
    
    newXg = [x+Ts*v*cos(theta) ; y+Ts*v*sin(theta) ; theta+Ts*w];
     
end