function xdot = complete_regulation(X, xstar, ystar, thetastar, Ts)

    
    x=X(1);
    y=X(2);
    theta=X(3);
    
    K1 = 1;
    K2 = 1;
    K3 = 1;
    
    ex=xstar-x;
    ey=ystar-y;
    import control.angle.delta_angle;
    etheta=delta_angle(thetastar,theta);
    
    rho=norm([ex;ey]);
    gamma=delta_angle(atan2(ex,ey),theta);
    delta=delta_angle(gamma,etheta);
    
    v=K1*rho*cos(gamma);
    w=K2*gamma+K1*(sin(gamma)*cos(gamma)/gamma)*(gamma+K3*delta);
    
    xdot = [x+Ts*v*cos(theta) ; 
            y+Ts*v*sin(theta) ; 
            theta+Ts*w];
end