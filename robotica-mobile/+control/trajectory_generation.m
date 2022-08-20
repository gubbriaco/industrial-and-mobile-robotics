function [xstar, ystar, xdotstar, ydotstar] = trajectory_generation(P, grade)

    % S e' la stima dell'errore
    % mu:
    % mu(1) = mean e' la media 
    % mu(2) = std e' la deviazione standard

    X = P(:,1);
    yX = X;
    size_yX = size(yX);
    xX = linspace(0, size_yX(1)-1, size_yX(1));
    [Xcoff, SX, muX] = polyfit(xX, yX, grade);
    xstar = @(t)polyval(Xcoff, xX, SX, muX);
    xstar = xstar(1);
    xdotstar = diff(xstar);
    
    Y = P(:,2);
    yY = Y;
    size_yY = size(yY);
    xY = linspace(0, size_yY(1)-1, size_yY(1));
    [Ycoff, SY, muY] = polyfit(xY, yY, grade);
    ystar = @(t)polyval(Ycoff, xY, SY, muY);
    ystar = ystar(1);
    ydotstar = diff(ystar);

end