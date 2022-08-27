function dot = cartesian_regulation(X0, Xf, Ts)
    
    x=X0(1); y=X0(2); theta=X0(3);
    
    xstar=Xf(1); ystar=Xf(2);
    
    K1=1; K2=1;
    
    ex=xstar-x;

    ey=ystar-y;
    
    v = K1*ex*(cos(theta) + ey*sin(theta));
    if norm([ex;ey])<=0.001
        w=0;
    else
        import control.angle.delta_angle;
        w = K2*(delta_angle(atan2(ey,ex),theta));
    end
    
    
   dot = [x+Ts*v*cos(theta) ; y+Ts*v*sin(theta) ; theta+Ts*w];
    
end