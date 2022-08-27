function dot = complete_regulation(X0, Xf, Ts)

    x=X0(1); y=X0(2); theta=X0(3);
    
    xstar = Xf(1); ystar = Xf(2); thetastar = Xf(3);
    
    K1 = 1; K2 = 1; K3 = 1;
    
    ex = xstar-x;
    ey = ystar-y;
    import control.angle.delta_angle;
    etheta = delta_angle(thetastar,theta);
    
    rho = norm([ex;ey]);
    gamma = delta_angle(atan2(ey,ex),theta);
    delta = delta_angle(gamma,etheta);
    
    v = K1*rho*cos(gamma);
    w = K2*gamma + K1*(sin(gamma)*cos(gamma)/gamma)*(gamma+K3*delta);
    
    dot = [x+Ts*v*cos(theta) ; y+Ts*v*sin(theta) ; theta+Ts*w];
    
end