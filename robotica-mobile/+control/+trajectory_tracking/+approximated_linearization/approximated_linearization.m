function [v,w] = approximated_linearization(xstar, x, ystar, y, theta, thetastar, ...
                                            vstar, omegastar)
    
                                        
    a = 1;
    delta = 0.99;
    
    K1 = 2*delta*a;
    K2 = (a^2 - omegastar^2)/vstar;
    K3 = 2*delta*a;
    
    ex = xstar - x;
    ey = ystar - y;
    etheta = thetastar - theta;
    
    u1 = -K1*ex;
    u2 = -K2*ey - K3*etheta;
    
    v = vstar * cos(etheta) - u1;
    w = omegastar - u2;

end