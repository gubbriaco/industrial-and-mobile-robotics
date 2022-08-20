function [v,w] = non_linearization( xstar, xdotstar, x, ...
                                     ystar, ydotstar, y, ...
                                     theta, thetastar, ...
                                     vstar, omegastar)

    K1 = @(vstar,omegastar)(ones(size(vstar)));
    K2 = 1;
    K3 = @(vstar,omegastar)(ones(size(vstar)));
    
    
    ex = xstar-x;
    ey = ystar-y;
    etheta = angdiff(thetastar, theta);

    u1 = -K1(vstar,omegastar)*ex;
    u2 = -K2*vstar*(sin(etheta)/etheta)*(-K3(vstar,omegastar)*etheta);
    
    v = vstar*cos(etheta) - u1;
    w = omegastar - u2;

end