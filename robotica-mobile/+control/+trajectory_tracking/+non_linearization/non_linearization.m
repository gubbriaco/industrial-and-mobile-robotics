function newXg = non_linearization(Ts, Xg, xstar, ystar, xdstar, ydstar,...
                                           xddstar, yddstar, thetastar)
    
    x = Xg(1);
    y = Xg(2);
    theta = Xg(3);

    vstar = sqrt(xdstar^2 + ydstar^2);
    if vstar < 0.001
        vstar = 0.01;
    end
    omegastar = (yddstar*xdstar-ydstar*xddstar)/(vstar^2);

    K1 = @(vstar,omegastar)(ones(size(vstar)));
    K2 = 10;
    K3 = @(vstar,omegastar)(ones(size(vstar)));
    
    
    ex = cos(theta)*(xstar-x) + sin(theta)*(ystar-y);
    ey = -sin(theta)*(xstar-x) + cos(theta)*(ystar-y);
    import control.angle.delta_angle;
    etheta = delta_angle(thetastar, theta);

    u1 = -K1(vstar,omegastar)*ex;
    u2 = -K2*vstar*(sin(etheta)/etheta)*(-K3(vstar,omegastar)*etheta);
    
    v = vstar*cos(etheta) - u1;
    w = omegastar - u2;
    
    newXg = [x+Ts*v*cos(theta) ; y+Ts*v*sin(theta) ; theta+Ts*w];

end