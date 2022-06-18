clear; close all; clc;

%% CONFIGURAZIONE PUMA560 secondo la convenzione di Denavit-Hartenberg

% definisco le distanze tra il sistema di riferimento Oi-esimo ed il
% sistema di riferimento Oi-esimo'
link1 = 0; link2 = 0.9; link3 = 0.9;
links = [link1 link2 link3];

% definisco gli angoli intorno all'asse xi-esimo tra l'asse zi-esimo
% valutato positivo in senso anti-orario
alpha1 = pi/2; alpha2 = 0; alpha3 = 0;
alphas = [alpha1 alpha2 alpha3];

% definisco le coordinate su zi-esimo-1 del sistema di riferimento
% Oi-esimo'
d1 = 0.35; d2 = 0; d3 = 0;
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
puma560 = PUMA560Configuration(links, alphas, ds, thetas, R0b);

% definisco ,tramite il Robotic Toolbox, gli oggetti 'Link', cioe' quelli
% che rappresenteranno i singoli corpi rigidi (bracci) che compongono il
% robot in questione passando come parametri le properties (variabili di 
% istanza) inizialzzate precedentemente tramite il costruttore
puma560.LINK1 = Link( [puma560.theta1, puma560.d1, puma560.link1, puma560.alpha1, PUMA560Configuration.revolute], 'standard' );
puma560.LINK2 = Link( [puma560.theta2, puma560.d2, puma560.link2, puma560.alpha2, PUMA560Configuration.revolute], 'standard' );
puma560.LINK3 = Link( [puma560.theta3, puma560.d3, puma560.link3, puma560.alpha3, PUMA560Configuration.revolute], 'standard' );

% salvo i link appena definiti in un array
LINKS = [puma560.LINK1 puma560.LINK2 puma560.LINK3];

% costruisco il robot con lausilio la classe concreta SerialLink che mi 
% permette di rappresentare il robot, avente collegamenti rigidi, tramite
% il collegamento seriale
robot = SerialLink(LINKS, 'name', 'PUMA 560');
         
% raffiguro il robot appena costruito secondo dei theta inizializzati tutti
% quanti a 0 solo per uno scopo visivo, cioe' per visualizzare il robot
figure();
robot.plot( [puma560.theta1 puma560.theta2 puma560.theta3] );


%% PUNTI

P1 = [0.8 0.8 0.5]';
P2 = [1.2 0.8 0.5]';
P3 = [1.0 1.2 0.5]';
POINTS = [P1 P2 P3];

figure();
plot3(P1(1), P1(2), P1(3), 'o', 'Color', 'b');
hold on;
plot3(P2(1), P2(2), P2(3), 'o', 'Color', 'b');
hold on;
plot3(P3(1), P3(2), P3(3), 'o', 'Color', 'b');
grid on; xlabel('X'); ylabel('Y'); zlabel('Z');

Qp1 = CinematicaInversa(links, P1);
Qp2 = CinematicaInversa(links, P2);
Qp3 = CinematicaInversa(links, P3);


%% CINEMATICA DIRETTA
T01 = CinematicaDiretta(links, Qp1);
T12 = CinematicaDiretta(links, Qp2);
T23 = CinematicaDiretta(links, Qp3);

%% TEMPO
TEMPO_TOTALE = 40;
% P1->P2 t2-t1 40/3
% P2->P3 t3-t2 40/3
% P3->P1 t4-t3 40/3
T1 = 0;
T2 = TEMPO_TOTALE/3;
T3 = T2 + TEMPO_TOTALE/3;
T4 = T3 + TEMPO_TOTALE/3;

%% LAMBDA E SIGMA
passoSigma=0.05;
sigma=0:passoSigma:1;

lambda = poly5(sigma);
lambda_d = poly5d(sigma);


%% PERCORSO TRIANGOLO
%passoLambda = 0.00125;
%lambda = 0:passoLambda:1;

[P1P2, Q1Q2, QQd12] = Percorso.Triangolo(links,lambda,lambda_d,T1,T2, P1, P2, Qp1, Qp2);
[P2P3, Q2Q3, QQd23] = Percorso.Triangolo(links,lambda,lambda_d,T2,T3, P2, P3, Qp2, Qp3);
[P3P1, Q3Q1, QQd31] = Percorso.Triangolo(links,lambda,lambda_d,T3,T4, P3, P1, Qp3, Qp1);

figure(); title("PERCORSO TRIANGOLO");
plot3(P1(1), P1(2), P1(3), 'o', 'Color', 'red'); hold on;
plot3(P2(1), P2(2), P2(3), 'o', 'Color', 'green'); hold on;
plot3(P3(1), P3(2), P3(3), 'o', 'Color', 'blue'); hold on;
plot3(P1P2(:,1), P1P2(:,2), P1P2(:,3), '>'); hold on;
plot3(P2P3(:,1), P2P3(:,2), P2P3(:,3), '<'); hold on;
plot3(P3P1(:,1), P3P1(:,2), P3P1(:,3), '<');
legend("P1", "P2", "P3","P1->P2", "P2->P3", "P3->P1");
grid on; xlabel('X'); ylabel('Y'); zlabel('Z');

figure(); title("PERCORSO TRIANGOLO");
subplot(3,1,1); plot(lambda, Q1Q2);
title("P1->P2"); xlabel("\lambda"); ylabel("radians"); legend('Q1','Q2','Q3');
subplot(3,1,2); plot(lambda, Q2Q3);
title("P2->P3");  xlabel("\lambda"); ylabel("radians"); legend('Q1','Q2','Q3');
subplot(3,1,3); plot(lambda, Q3Q1);
title("P3->P1");  xlabel("\lambda"); ylabel("radians"); legend('Q1','Q2','Q3');

%definisco il tempo
t12 = T1 + lambda*(T2-T1);
t23 = T2 + lambda*(T3-T2);
t31 = T3 + lambda*(T4-T3);

N = length(lambda);
tt12 = [0 t12(2:N)];
tt23 = [13.3333 t23(2:N)];
tt31 = [26.6667 t31(2:N)];

figure(); title("VELOCITA' TRIANGOLO");
subplot(3,1,1); plot(tt12, QQd12);
title("P1->P2"); xlabel("\lambda"); ylabel("velocita'"); legend('Q1d','Q2d','Q3d');
subplot(3,1,2); plot(tt23, QQd23);
title("P2->P3");  xlabel("\lambda"); ylabel("velocita'"); legend('Q1d','Q2d','Q3d');
subplot(3,1,3); plot(tt31, QQd31);
title("P3->P1");  xlabel("\lambda"); ylabel("velocita'"); legend('Q1d','Q2d','Q3d');

%% PERCORSO CIRCONFERENZA
passoLambda = 0.00125;
lambda = 0:passoLambda:1;

%centro circonferenza
centro = [1;0.95;0.5];
%raggio circonferenza
raggio = 0.25;

[PP2, Q1Q2, Q12] = Percorso.Circonferenza(lambda, centro, raggio, P1P2);
[PP3, Q2Q3, Q23] = Percorso.Circonferenza(lambda, centro, raggio, P2P3);
[PP1, Q3Q1, Q31] = Percorso.Circonferenza(lambda, centro, raggio, P3P1);

figure(); title("PERCORSO CIRCONFERENZA");
plot3(P1(1), P1(2), P1(3), 'o', 'Color', 'red'); hold on;
plot3(P2(1), P2(2), P2(3), 'o', 'Color', 'green'); hold on;
plot3(P3(1), P3(2), P3(3), 'o', 'Color', 'blue'); hold on;
plot3(P1P2(:,1),P1P2(:,2),P1P2(:,3),'>'); hold on;
plot3(P2P3(:,1),P2P3(:,2),P2P3(:,3),'<'); hold on;
plot3(P3P1(:,1),P3P1(:,2),P3P1(:,3),'<'); hold on;

plot3(PP2(:,1),PP2(:,2),PP2(:,3),'>'); hold on;
plot3(PP3(:,1),PP3(:,2),PP3(:,3),'<'); hold on;
plot3(PP1(:,1),PP1(:,2),PP1(:,3),'<');
legend("P1", "P2", "P3","P1->P2", "P2->P3", "P3->P1","Circonferenza");
grid on; xlabel('X'); ylabel('Y'); zlabel('Z');

figure(); title("PERCORSO CIRCONFERENZA");
subplot(3,1,1); plot(lambda, Q1Q2);
title("P1->P2"); xlabel("\sigma"); ylabel("radians"); legend('Q1','Q2','Q3');
subplot(3,1,2); plot(lambda, Q2Q3);
title("P2->P3");  xlabel("\sigma"); ylabel("radians"); legend('Q1','Q2','Q3');
subplot(3,1,3); plot(lambda, Q3Q1);
title("P3->P1");  xlabel("\sigma"); ylabel("radians"); legend('Q1','Q2','Q3');