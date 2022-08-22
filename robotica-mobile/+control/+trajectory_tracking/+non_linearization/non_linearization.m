function xdot = non_linearization(xstar, x, ystar, y, theta, thetastar, vstar, omegastar)

    K1 = @(vstar,omegastar)(ones(size(vstar)));
    K2 = 1;
    K3 = @(vstar,omegastar)(ones(size(vstar)));
    
    
    ex = xstar-x;
    ey = ystar-y;
    import control.angle.delta_angle;
    etheta = delta_angle(thetastar, theta);

    u1 = -K1(vstar,omegastar)*ex;
    u2 = -K2*vstar*(sin(etheta)/etheta)*(-K3(vstar,omegastar)*etheta);
    
    v = vstar*cos(etheta) - u1;
    w = omegastar - u2;
    
    xdot = [v.*cos(theta) ; v.*sin(theta) ; w];

end