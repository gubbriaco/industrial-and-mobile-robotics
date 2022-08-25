function P = artificial_potential_fields()

    global goal start obstacles grid X Y width height;

    d = bwdist(grid); %bdwist function restituisce la distanza da ogni "true" element nell'array degli ostacoli

    % Rescale and transform distances

    Rho = (d/10) + 1; %aggiungiamo l'1 perchè qualche
                      %valore di d=0 e potremmo avere
                      %problemi nel calcolo del repulsivo
    d0 = 2;     %peso del repulsivo. Se il robot si allonana più di d0 il repulsivo sarà pari a 0
    Eta = 81.7;  %utilizzando per controllare la forza del repulsivo
                %Eta grande crea molta differenza tra forza repulsiva e
                %attrattiva. Bisogna mettere il repulsivo ampio per fare in
                %modo che il robot non vada contro l'ostacolo

    repulsive = Eta*((1./Rho - 1/d0).^2);

    repulsive (Rho > d0) = 0;


    % Compute attractive force

    xi = 1/15;     % usato per controllare la forza attrattiva
    %                 per esempio se xi=1/1000 il robot non raggiunge il goal
    %                 perchè la forza attrattiva è poca
    %                 per xi=1/10, il robot passa attraverso gli ostacoli

    attractive = xi * ( (X - goal(1)).^2 + (Y - goal(2)).^2 );

    % Combine terms
    f = attractive + repulsive;
    maxi = max(attractive(~isinf(attractive))); repulsive(isinf(repulsive)) = maxi;

    figure(1);
    m=mesh(repulsive);
    m.FaceLighting = 'phong';
    axis equal;
    title ('Potenziale Repulsivo');

    figure(2);
    m = mesh (attractive);
    m.FaceLighting = 'phong';
    axis equal;
    title ('Potenziale Attrattivo');

    figure(3);
    m = mesh (f);
    m.FaceLighting = 'phong';
    axis equal;
    title ('Potenziale Totale');

    figure(4);
    axis([0 100 0 100]);
    title ('Ambiente di lavoro');
           for i = 1 : 8
              ob = obstacles(i,:);
              rectangle("position",[ob(1) ob(3) ob(2)-ob(1) ob(4)-ob(3)],"facecolor","b");
           end 
    hold on; plot(start(1),start(2), "o","LineWidth",20,"Color","y");
    hold on; plot(goal(1),goal(2), "o","LineWidth",20, "Color","g");

    import path_planning.artificial_potential_fields.gradient_based_planner; 
    P = gradient_based_planner(f, start, goal, 1000);

    %% Plot the energy surface

    % figure(5);
    % m = mesh (f);
    % axis equal;
    % 
    % %% Plot ball sliding down hill
    % 
    % animate = 1;
    % if animate
    %     [sx, sy, sz] = sphere(1);
    % 
    %     scale = 50;
    %     sx = scale*sx;
    %     sy = scale*sy;
    %     sz = scale*(sz+1);
    % 
    %     hold on;
    %     p = mesh(sx, sy, sz);
    %     p.FaceColor = 'red';
    %     p.EdgeColor = 'none';
    %     p.FaceLighting = 'phong';
    %     hold off;
    % 
    %     for i = 1:size(cammino,1)
    %         P = round(cammino(i,:));
    %         z = f(P(2), P(1));
    % 
    %         p.XData = sx + P(1);
    %         p.YData = sy + P(2);
    %         p.ZData = sz + f(P(2), P(1));
    % 
    %         drawnow;
    % 
    % %         drawnow;
    % %         pause(0.5);
    % %     end
    % end

    % % quiver plot
    [gx, gy] = gradient (-f);
    for i = 1 : size(grid,1)
        for j = 1 : size(grid,2)
            if grid(i,j) == 1
                gx(i,j) = 0; gy(i,j) = 0;
            end
        end
    end
    skip = 2;

    figure;

    xidx = 1:skip:width;
    yidx = 1:skip:height;

    quiver (X(yidx,xidx), Y(yidx,xidx), gx(yidx,xidx), gy(yidx,xidx), 0.7);

    axis ([1 width 1 height]);

    hold on;

    ps = plot(start(1), start(2), 'r.', 'MarkerSize', 30);
    pg = plot(goal(1), goal(2), 'g.', 'MarkerSize', 30);
    p3 = plot (P(:,1), P(:,2), 'r', 'LineWidth', 2);
    xlabel('X')
    ylabel('Y')
end