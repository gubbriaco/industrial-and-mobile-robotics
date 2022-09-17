function [xstar, ystar, xdstar, ydstar, xddstar, yddstar, thetastar]...
    = trajectory_generation(P, samples)

    % questa function permette la generazione della traiettoria di
    % riferimento tramite la function trapveltraj.

    Px = P(:,1)';
    Py = P(:,2)';
    wpts = [Px ; Py];
    
    [q, qd, qdd, tvec, pp] = trapveltraj(wpts, samples);
    

    xstar = q(1,:);
    ystar = q(2,:);

    xdstar = qd(1,:);
    ydstar = qd(2,:);

    xddstar = qdd(1,:);
    yddstar = qdd(2,:);

    thetastar = atan2(ydstar, xdstar);
    
    
end