function [xstar, ystar, xdotstar, ydotstar, thetastar, thetadotstar] = trajectory_generation(P, grade)
    
    % interp1(0:1:size_P(1)-1,P(:,1),P(:,2),'spline')

    syms t;

%     S e' la stima dell'errore
%     mu:
%     mu(1) = mean e' la media 
%     mu(2) = std e' la deviazione standard

    X = P(:,1);
    yX = X;
    size_yX = size(yX);
    xX = linspace(0, size_yX(1)-1, size_yX(1));
    [Xcoff, SX, muX] = polyfit(xX, yX, grade);
    xstarf = @(t)polyval(Xcoff, xX, SX, muX);
    xstar = xstarf(t);
    xdotstar = diff(xstar);
    
    Y = P(:,2);
    yY = Y;
    size_yY = size(yY);
    xY = linspace(0, size_yY(1)-1, size_yY(1));
    [Ycoff, SY, muY] = polyfit(xY, yY, grade);
    ystarf = @(t)polyval(Ycoff, xY, SY, muY);
    ystar = ystarf(t);
    ydotstar = diff(ystar);
    
    
    thetastar = atan2(xstar, ystar);
    
    
end