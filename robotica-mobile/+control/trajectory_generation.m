function [xstar, ystar, xdotstar, ydotstar] = trajectory_generation(P, grade)
    
    syms t;
%     xstar = @(t)(t);
% 
%     size_P = size(P);
%     time = linspace(0, size_P(1)-1, size_P(1));
%     [coff, S, mu] = polyfit(P(:,1), P(:,2), grade);
%     ystar = @(t)polyval(coff, time, S, mu);
%     



%     S e' la stima dell'errore
%     mu:
%     mu(1) = mean e' la media 
%     mu(2) = std e' la deviazione standard

    X = P(:,1);
    yX = X;
    size_yX = size(yX);
    xX = linspace(0, size_yX(1)-1, size_yX(1));
    [Xcoff, SX, muX] = polyfit(xX, yX, grade);
    xstar = @(t)polyval(Xcoff, xX, SX, muX);
    xstar = xstar(t);
    xdotstar = diff(xstar);
    
    Y = P(:,2);
    yY = Y;
    size_yY = size(yY);
    xY = linspace(0, size_yY(1)-1, size_yY(1));
    [Ycoff, SY, muY] = polyfit(xY, yY, grade);
    ystar = @(t)polyval(Ycoff, xY, SY, muY);
    ystar = ystar(t);
    ydotstar = diff(ystar);
    
    
end