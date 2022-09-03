function init_exec()

    %% ********************************************************************
    % script per la configurazione del robot e dell'ambiente 
    %% ********************************************************************

    
    %% CONFIGURAZIONE PUMA560 secondo la convenzione di Denavit-Hartenberg

    % definisco le distanze tra il sistema di riferimento Oi-esimo ed il
    % sistema di riferimento Oi-esimo'
    link1 = 0; link2 = 0.9; link3 = 0.9;
    global links
    links = [link1 link2 link3];

    % definisco gli angoli intorno all'asse xi-esimo tra l'asse zi-esimo
    % valutato positivo in senso anti-orario
    alpha1 = pi/2; alpha2 = 0; alpha3 = 0;
    alphas = [alpha1 alpha2 alpha3];

    % definisco le coordinate su zi-esimo-1 del sistema di riferimento
    % Oi-esimo'
    d1 = 0; d2 = 0; d3 = 0;
    ds = [d1 d2 d3];

    % definisco gli angoli intorno all'asse zi-esimo-1 tra l'asse xi-esimo-1 e
    % l'asse xiesimo valutato positivo in senso anti-orario
    theta1 = 0; theta2 = 0; theta3 = 0;
    thetas = [theta1 theta2 theta3];

    % definisco la matrice di roto-traslazione che lega i sistemi di
    % riferimento (0) e (b)
    R0b = [1 0 0 0.5;0 1 0 0.5;0 0 1 1;0 0 0 1];


    %% CREAZIONE ROBOT
    % creo la configurazione del robot in questione tramite il costruttore
    % della classe PUMA560Configuration che riceve i parametri utili alla sua
    % configurazione
    global puma560
    import puma560.PUMA560Configuration;
    puma560 = PUMA560Configuration(links, alphas, ds, thetas, R0b);

    % definisco ,tramite il Robotic Toolbox, gli oggetti 'Link', cioe' quelli
    % che rappresenteranno i singoli corpi rigidi (bracci) che compongono il
    % robot in questione passando come parametri le properties (variabili di 
    % istanza) inizialzzate precedentemente tramite il costruttore
    puma560.LINK1 = Link( [puma560.theta1, puma560.d1, puma560.link1, ...
              puma560.alpha1, PUMA560Configuration.revolute], 'standard' );
    puma560.LINK2 = Link( [puma560.theta2, puma560.d2, puma560.link2, ...
              puma560.alpha2, PUMA560Configuration.revolute], 'standard' );
    puma560.LINK3 = Link( [puma560.theta3, puma560.d3, puma560.link3, ...
              puma560.alpha3, PUMA560Configuration.revolute], 'standard' );

    % salvo i link appena definiti in un array
    LINKS = [puma560.LINK1 puma560.LINK2 puma560.LINK3];

    % costruisco il robot con lausilio la classe concreta SerialLink che mi 
    % permette di rappresentare il robot, avente collegamenti rigidi, tramite
    % il collegamento seriale
    global robot
    robot = SerialLink(LINKS, 'name', 'PUMA 560');

    % raffiguro il robot appena costruito secondo dei theta inizializzati tutti
    % quanti a 0 solo per uno scopo visivo, cioe' per visualizzare il robot
    % figure();
    % robot.plot( [puma560.theta1 puma560.theta2 puma560.theta3] );


    %% PUNTI
    global P1 P2 P3
    P1 = [0.8 0.8 0.5]';
    P2 = [1.2 0.8 0.5]';
    P3 = [1.0 1.2 0.5]';
    POINTS = [P1 P2 P3];

end