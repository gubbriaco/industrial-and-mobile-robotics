function newXg = approximated_linearization(Ts, Xg, xstar, ystar, xdstar, ydstar,...
                                           xddstar, yddstar, thetastar)
    
              
    x = Xg(1);
    y = Xg(2);
    theta = Xg(3);
    
    vstar = sqrt(xdstar^2 + ydstar^2);
    if vstar < 0.001
        vstar = 0.01;
    end
    omegastar = (yddstar*xdstar-ydstar*xddstar)/(vstar^2);
    
    
    
    a = 1;
    delta = 0.99;
    
    K1 = 2*delta*a;
    if vstar < 0.001
        vstar = 0.01;
    end
    K2 = (a^2 - omegastar^2)/vstar;
    
    K3 = 2*delta*a;
    
    
    ex = cos(theta)*(xstar-x) + sin(theta)*(ystar-y);
    ey = -sin(theta)*(xstar-x) + cos(theta)*(ystar-y);
    import control.angle.delta_angle;
    etheta = delta_angle(thetastar, theta);
    
    u1 = -K1*ex;
    u2 = -K2*ey - K3*etheta;
    
    v = vstar * cos(etheta) - u1;
    w = omegastar - u2;

    newXg = [x+Ts*v*cos(theta) ; y+Ts*v*sin(theta) ; theta+Ts*w];
    
end