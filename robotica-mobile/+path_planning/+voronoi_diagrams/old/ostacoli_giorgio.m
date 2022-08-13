function [X,Y,grid,obstacles] = ostacoli()
    
    x_origin=1; y_origin=1;
    width=100; height=100;
    grid = zeros(width, height);
    nr_points=100;
    width_points=linspace(x_origin-1, nr_points, width);
    height_points=linspace(y_origin-1, nr_points, height);
    [X,Y] = meshgrid(width_points,height_points);
   
    
    nr_obstacles = 0; obstacles = [];
    %% EDGES
    edge_height = 1;
    
    % over edge
    nr_obstacles=nr_obstacles+1;
    grid(1:2,1:width) = edge_height;
    obstacles(nr_obstacles,:) = [X(1,1) X(1,width) Y(1) Y(2)];
    nr_obstacles=nr_obstacles+1;
    % under edge
    grid(width-1:width,1:width) = edge_height;
    obstacles(nr_obstacles,:) = [X(1,1) X(1,width) Y(width-1) Y(width)];
    nr_obstacles=nr_obstacles+1;
    % left edge
    grid(1:width,1:2) = edge_height;
    obstacles(nr_obstacles,:) = [X(1,1) X(1,2) Y(1) Y(width)];
    nr_obstacles=nr_obstacles+1;
    % right edge
    grid(1:width,width-1:width) = edge_height;
    obstacles(nr_obstacles,:) = [X(1,width-1) X(1,width) Y(1) Y(width)];
    nr_obstacles=nr_obstacles+1;
    
    
    %% OBSTACLES
    obstacle_height = 1;
    
    % obstacles nr.1
    x_left=15; x_right=25;
    y_under=10; y_over=20;
    grid(y_under:y_over,x_left:x_right) = obstacle_height;
    nr_obstacles = nr_obstacles+1;
    obstacles(nr_obstacles,:) = [X(1,y_under) X(1,y_over) Y(x_left) Y(x_right)];
    
    % obstacles nr.2
    x_left=40; x_right=45;
    y_under=15; y_over=70;
    grid(y_under:y_over,x_left:x_right) = obstacle_height;
    nr_obstacles = nr_obstacles+1;
    obstacles(nr_obstacles,:) = [X(1,y_under) X(1,y_over) Y(x_left) Y(x_right)];
    
    % obstacles nr.3
    x_left=15; x_right=35;
    y_under=30; y_over=60;
    grid(y_under:y_over,x_left:x_right) = obstacle_height;
    nr_obstacles = nr_obstacles+1;
    obstacles(nr_obstacles,:) = [X(1,y_under) X(1,y_over) Y(x_left) Y(x_right)];
    
    % obstacles nr.4
    x_left=60; x_right=90;
    y_under=15; y_over=60;
    grid(y_under:y_over,x_left:x_right) = obstacle_height;
    nr_obstacles = nr_obstacles+1;
    obstacles(nr_obstacles,:) = [X(1,y_under) X(1,y_over) Y(x_left) Y(x_right)];
    
    % obstacles nr.5
    x_left=15; x_right=60;
    y_under=80; y_over=90;
    grid(y_under:y_over,x_left:x_right) = obstacle_height;
    nr_obstacles = nr_obstacles+1;
    obstacles(nr_obstacles,:) = [X(1,y_under) X(1,y_over) Y(x_left) Y(x_right)];
    
    % obstacles nr.6
    x_left=70; x_right=90;
    y_under=70; y_over=90;
    grid(y_under:y_over,x_left:x_right) = obstacle_height;
    nr_obstacles = nr_obstacles+1;
    obstacles(nr_obstacles,:) = [X(1,y_under) X(1,y_over) Y(x_left) Y(x_right)];
    
    
    %% PLOT
    Z = 1.*grid;
    figure(); mesh(X,Y,Z); xlabel("X"); ylabel("Y"); zlabel("Z");
    axis("equal"), axis([0 100 0 100])

end