function [r] = obstacle_intersect(xline, yline, xobst, yobst)

    xobsti = xobst(1); xobstf = xobst(2);
    yobsti = yobst(1); yobstf = yobst(2);

    xline = linspace(xline(1),xline(2),1000)';
    yline = linspace(yline(1),yline(2),1000)';

    if length(xline) == 1
        xline = ones(length(yline),1)*xline;
    elseif length(yline) == 1
        yline = ones(length(xline),1)*yline;
    end

    c = xline > xobsti & xline < xobstf & yline > yobsti & yline < yobstf;

    r = ~isempty(find(c,1));

end