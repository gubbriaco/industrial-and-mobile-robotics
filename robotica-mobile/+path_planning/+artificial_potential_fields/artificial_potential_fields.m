function P = artificial_potential_fields(environment)

    global goal start grid X Y width height;

    d = bwdist(grid); %bdwist function restituisce la distanza da ogni 
    % "true" element nell'array degli ostacoli

    
    % Rescale and transform distances

    Rho = (d/10) + 1; %aggiungiamo l'1 perchè qualche valore di d=0 e 
    % potremmo avere problemi nel calcolo del repulsivo
    d0 = 2;     % peso del repulsivo. Se il robot si allonana più di d0 il 
    % repulsivo sarà pari a 0
    Eta = 163.4000; %utilizzando per controllare la forza del repulsivo Eta 
    % grande crea molta differenza tra forza repulsiva e attrattiva. 
    % Bisogna mettere il repulsivo ampio per fare in modo che il robot non 
    % vada contro l'ostacolo

    % formula repulsivo
    repulsive = (1/2)*Eta*((1./Rho - 1/d0).^2);

    
    % se la distanza da cui si trova il robot e' maggiore di Rho allora il
    % repulsivo in questo punto sara' pari a 0
    repulsive (Rho > d0) = 0;


    % Compute attractive force

    xi = 1/15;     % usato per controllare la forza attrattiva -> per 
    % esempio se xi=1/1000 il robot non raggiunge il goal perchè la forza 
    % attrattiva è poca per xi=1/10, il robot passa attraverso gli ostacoli

    % formula attrattivo
    attractive = xi * ( (X - goal(1)).^2 + (Y - goal(2)).^2 );

    
    % Combine terms
    % potenziale totale
    fAR = attractive + repulsive;

    f=figure(); f.Position=[25 342 1500 420]; 
    subplot(1,3,1); m=mesh(repulsive); m.FaceLighting = 'phong'; axis equal;
    title ("REPULSIVE POTENTIAL");
    subplot(1,3,2); m = mesh (attractive); m.FaceLighting = 'phong'; %axis equal;
    title ("ATRACTIVE POTENTIAL");
    subplot(1,3,3); m = mesh (fAR); m.FaceLighting = 'phong'; %axis equal;
    title ("TOTAL POTENTIAL");

    
    import path_planning.artificial_potential_fields.gradient_based_planner; 
    P = gradient_based_planner(fAR, start, goal, 1000);

  

    %% QUIVER PLOT
    % calcolo l'anti-gradiente
    [gx, gy] = gradient (-fAR);
    for i = 1 : size(grid,1)
        for j = 1 : size(grid,2)
            % in questa maniera all'interno dell'ostacolo non considero
            % potenziale repulsivo
            if grid(i,j)==1
                gx(i,j)=0; 
                gy(i,j)=0;
            end
        end
    end
    
    step = 2;
    xidx = 1 : step : width;
    yidx = 1 : step : height;

    figure();
    % quiver(___,scale) adjusts the length of arrows:
    % When scale is a positive number, the quiver function automatically 
    % adjusts the lengths of arrows so they do not overlap, then stretches 
    % them by a factor of scale. For example, a scale of 2 doubles the 
    % length of arrows, and a scale of 0.5 halves the length of arrows.
    % When scale is 'off' or 0, such as quiver(X,Y,U,V,'off'), then 
    % automatic scaling is disabled
    %
    % quiver(X,Y,U,V) plots arrows with directional components U and V at 
    % the Cartesian coordinates specified by X and Y. For example, the 
    % first arrow originates from the point X(1) and Y(1), extends 
    % horizontally according to U(1), and extends vertically according to 
    % V(1). By default, the quiver function scales the arrow lengths so 
    % that they do not overlap.
    quiver (X(yidx,xidx), Y(yidx,xidx), gx(yidx,xidx), gy(yidx,xidx), 0.7);
    axis ([1 width 1 height]);
    hold on;
    plot(start(1), start(2), 'r.', 'MarkerSize', 30);
    plot(goal(1), goal(2), 'g.', 'MarkerSize', 30);
    plot (P(:,1), P(:,2), 'r', 'LineWidth', 2);
    xlabel("X"), ylabel("Y");
    
    
end