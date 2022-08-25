function xdot = cartesian_regulation(X, xstar, ystar, Ts)
    
    x=X(1);
    y=X(2);
    theta=X(3);
    
    K1 = 1;
    K2 = 1;
    
    ex=xstar-x;
    ey=ystar-y;
    
    v=K1*ex*(cos(theta)+ey*sin(theta));
    if norm([ex;ey])<=0.001
        w=0;
    else
        import control.angle.delta_angle;
        w=K2*(delta_angle(atan2(ey,ex),theta));
    end
    
    
   xdot = [x+Ts*v*cos(theta) ; 
            y+Ts*v*sin(theta) ; 
            theta+Ts*w];
    
end