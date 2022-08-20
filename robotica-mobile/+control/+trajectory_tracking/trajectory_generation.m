function [xstar, ystar, xdotstar, ydotstar, xdotdotstar, ydotdotstar, ...
          thetastar, thetadotstar, thetadotdotstar, vstar, omegastar] = ...
                                            trajectory_generation(P, grade)
    
    % Considero le due colonne della traiettoria P essendo rispettivamente
    % le x e le y della traiettoria ottima ottenuta dal path planning. Per
    % ottenere un'approssimazione di tale percorso devo ottenere, quindi,
    % un'approssimazione di ogni colonna, cioe' sia delle x che delle y.
    % Pertanto, calcolo prima l'approssimazione delle x e poi quella delle
    % y. Ogni approssimazione viene calcolata per interpolazione
    % utilizzando le funzioni native 'polyfit' e 'polyval' di MATLAB. La 
    % prima permette di ottenere un fitting del polinomio corrispondete ai 
    % valori passati in input, cioe' i valori presenti nella colonna 
    % considerata (prima citata). Per la precisione vengono passati tre 
    % input alla funzione 'polyfit': il primo rappresenta le 'ascisse' (che
    % in entrambi i casi e' stato ottenuto per discretizzazione tramite la 
    % funzione nativa linspace di MATLAB considerando come range di valori
    % quello ottenuto considerando i valori della colonna in questione), il
    % secondo rappresenta le 'ordinate', quindi i valori che dovrebbero
    % essere rappresentati solitamente in un 'grafico 2D' (che in questo 
    % caso corrispondono ai valori delle due colonne considerate), il terzo
    % valore, infine, rappresenta il grado di interpolazione scelto per il
    % polinomio. La funzione 'polyfit' restituisce in output tre valori:
    % il primo e' un array che rappresenta i coefficienti del polinomio in
    % questione ottenuto, il secondo rappresenta il valore medio (@see mean
    % ), il terzo rappresenta la deviazione standard (@see std). Pertanto,
    % costruisco la funzione a partire dai risultati ottenuti tramite la
    % funzione 'polyval'  rispetto al tempo 't' passando come valori i
    % coefficienti, le ascisse considerate, il valore medio e la deviazione
    % standard ottenuti. Infine, la derivata di tale funzione puo' essere
    % calcolata tramite la funzione nativa 'diff' di MATLAB.



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
    xdotdotstar = diff(xdotstar);
    size_xdotdotstar = size(xdotdotstar);
    xdotdotstar = [xdotdotstar xdotdotstar(size_xdotdotstar(2))];
    
    Y = P(:,2);
    yY = Y;
    size_yY = size(yY);
    xY = linspace(0, size_yY(1)-1, size_yY(1));
    [Ycoff, SY, muY] = polyfit(xY, yY, grade);
    ystarf = @(t)polyval(Ycoff, xY, SY, muY);
    ystar = ystarf(t);
    ydotstar = diff(ystar);
    ydotdotstar = diff(ydotstar);
    size_ydotdotstar = size(ydotdotstar);
    ydotdotstar = [ydotdotstar ydotdotstar(size_ydotdotstar(2))];
    
    thetastar = atan2(xstar, ystar);
    thetadotstar = atan2(xdotstar, ydotstar);
    thetadotdotstar = atan2(xdotdotstar, ydotdotstar);
    
    vstar = sqrt(xdotstar.^2 + ydotstar.^2);
    omegastar = (ydotdotstar' * xdotstar - xdotdotstar' * ydotstar)/(xdotstar.^2 .* ydotstar.^2);
    
end