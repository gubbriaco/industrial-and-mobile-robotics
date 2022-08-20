function [v,w] = approximated_linearization( xstar, xdotstar, x, ...
                                             ystar, ydotstar, y, ...
                                             theta, thetastar, ...
                                             vstar, omegastar)
    
                                        
    a = 1;
    delta = 0.99;
    
    K1 = 2*delta*a;
    K2 = (a^2-(omegastar.^2))./vstar;
    size_K2 = size(K2);
    K2 = [K2;K2(size_K2(1),:)];
    K2 = [K2 K2(:,size_K2(1))];
    K3 = 2*delta*a;
    
    ex = xstar-x;
    ey = ystar-y;
    etheta = angdiff(thetastar, theta');
    
    u1 = -K1*ex;
    u2 = -K2.*ey - K3.*etheta;
    
    size_vstar = size(vstar);
    vstar = [vstar vstar(size_vstar(1))];
    v = vstar.*cos(etheta) - u1;
    
    size_omegastar = size(omegastar);
    omegastar = [omegastar;omegastar(size_omegastar(1))];
    w = omegastar - u2;

end