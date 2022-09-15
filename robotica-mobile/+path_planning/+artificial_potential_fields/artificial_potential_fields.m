function P = artificial_potential_fields(environment)

    global goal start grid X Y width height;

    d = bwdist(grid); %bdwist function restituisce la distanza da ogni 
    % "true" element nell'array degli ostacoli

    
    % Ridimensionamento e trasformazione delle distanze

    Rho = (d/10) + 1; %aggiungiamo l'1 perchè qualche valore di d=0 e 
    % potremmo avere problemi nel calcolo del repulsivo
    d0 = 2; % peso del repulsivo. Se il robot si allonana più di d0 il 
    % repulsivo sarà pari a 0
    Eta = 163.4000; %utilizzato per controllare la forza del repulsivo 
    % un Eta grande crea molta differenza tra forza repulsiva e attrattiva. 
    % Bisogna mettere il repulsivo ampio per fare in modo che il robot non 
    % vada contro l'ostacolo

    % formula repulsivo
    repulsive = (1/2)*Eta*((1./Rho - 1/d0).^2);

    
    % se la distanza da cui si trova il robot e' maggiore di Rho allora il
    % repulsivo in questo punto sara' pari a 0
    repulsive (Rho > d0) = 0;


    % Compute attractive force

    xi = 1/15; % usato per controllare la forza attrattiva -> per esempio 
    % se xi=1/1000 il robot non raggiunge il goal perchè la forza 
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
    % quiver(___,scale) regola la lunghezza delle frecce:
    % quando lo scale e' un numero positivo, quiver automaticamente regola
    % la lunghezza delle frecce in modo che non si sovrappongano, quindi le
    % allunga di un fattore di scala. Ad esempio, uno scale di 2 raddoppia
    % la lunghezza delle frecce, ed uno scale di 0.5 dimezza la lunghezza 
    % delle frecce. Quando il fattore di scale e' "off" o 0, lo scaling e'
    % automaticamente disattivato
    %
    % quiver(X,Y,U,V) plotta le frecce con componenti direzionali U e V 
    % alle coordinate cartesiane specificate da X e Y. Ad esempio, la prima
    % freccia ha origine dal punto X(1),Y(1) e si estende orizzontalmente
    % secondo U(1) e verticalmente secondo V(1). Per impostazione 
    % predefinita, quiver dimensiona la lunghezza delle frecce in modo che
    % non si sovrappongano.
    scale = 0.7;
    quiver (X(yidx,xidx),Y(yidx,xidx), gx(yidx,xidx),gy(yidx,xidx), scale);
    axis ([1 width 1 height]); xlabel("X"), ylabel("Y");
    hold on;
    plot(start(1),start(2), "r.", "MarkerSize",30);
    plot(goal(1),goal(2), "g.", "MarkerSize",30);
    plot (P(:,1),P(:,2), "r", "LineWidth",2);
    title("ARTIFICIAL POTENTIAL FIELDS QUIVER PLOT");
    
end