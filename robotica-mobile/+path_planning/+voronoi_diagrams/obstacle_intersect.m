function [intersection] = obstacle_intersect(x_line, y_line, xi_obst, yi_obst, xf_obst, yf_obst)

    x_line = linspace(x_line(1), x_line(2), 1000)';
    y_line = linspace(y_line(1), y_line(2), 1000)';
    
    if length(x_line) == 1
        x_line = ones(length(y_line),1)*x_line;
    elseif length(y_line) == 1
        y_line = ones(length(x_line),1)*y_line;
    end
    
    condition = x_line > xi_obst & x_line < xf_obst & y_line > yi_obst & y_line < yf_obst;
    
    intersection = ~isempty( find(condition, 1) );

end