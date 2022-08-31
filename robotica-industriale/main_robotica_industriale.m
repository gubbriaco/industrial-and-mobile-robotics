clear; close all; clc;
global links passoSigma sigma lambda lambdaDerivata raggio centro P1 P2 P3 robot puma560 t12 t23 t31;
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
import puma560.PUMA560Configuration;
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
% figure();
% robot.plot( [puma560.theta1 puma560.theta2 puma560.theta3] );


%% PUNTI
P1 = [0.8 0.8 0.5]';
P2 = [1.2 0.8 0.5]';
P3 = [1.0 1.2 0.5]';
POINTS = [P1 P2 P3];


%% CINEMATICA INVERSA
Qp1 = CinematicaInversa(links, P1);
Qp2 = CinematicaInversa(links, P2);
Qp3 = CinematicaInversa(links, P3);

%% CINEMATICA DIRETTA
T01 = CinematicaDiretta(links, Qp1);
T12 = CinematicaDiretta(links, Qp2);
T23 = CinematicaDiretta(links, Qp3);

%% LAMBDA E SIGMA
passoSigma = 0.05;
sigma = 0:passoSigma:1;

lambda = poly3(sigma);
lambdaDerivata = poly3d(sigma);

%% TEMPO
TEMPO_TOTALE = 40;
% P1->P2 t2-t1 40/3
% P2->P3 t3-t2 40/3
% P3->P1 t4-t3 40/3
offset = 10;
T1 = 0;
T2 = T1+(TEMPO_TOTALE/3);
T3 = T2+(TEMPO_TOTALE/3);
T4 = T3+(TEMPO_TOTALE/3);

%definisco il tempo
t12 = T1 + lambda*(T2-T1);
t23 = T2 + lambda*(T3-T2);
t31 = T3 + lambda*(T4-T3);


%% TRIANGOLO
Plot.Punti();

% segmento P1->P2
[P1P2segmento, P1P2segmentoDerivata, Q1Q2segmento, Q1Q2segmentoDerivata] = Percorso.Segmento(T1,T2, P1, P2, Qp1, Qp2);
% segmento P2->P3
[P2P3segmento, P2P3segmentoDerivata, Q2Q3segmento, Q2Q3segmentoDerivata] = Percorso.Segmento(T2,T3, P2, P3, Qp2, Qp3);
% segmento P3->P1
[P3P1segmento, P3P1segmentoDerivata, Q3Q1segmento, Q3Q1segmentoDerivata] = Percorso.Segmento(T3,T4, P3, P1, Qp3, Qp1);
grid on; xlabel('X'); ylabel('Y'); zlabel('Z');

%% ERRORE triangolo
Errore.Triangolo(P1P2segmento, Q1Q2segmento, P2P3segmento, Q2Q3segmento, P3P1segmento, Q3Q1segmento);

%% PLOT PERCORSO TRIANGOLO
Plot.Triangolo(P1P2segmento, P2P3segmento, P3P1segmento);

Plot.VariabiliDiGiuntoTriangolo(Q1Q2segmento, Q2Q3segmento, Q3Q1segmento);
Plot.VariabiliDiGiuntoDerivataTriangolo(Q1Q2segmentoDerivata, Q2Q3segmentoDerivata, Q3Q1segmentoDerivata);
Plot.VelocitaCoperturaTriangolo(P1P2segmentoDerivata, P2P3segmentoDerivata, P3P1segmentoDerivata);


%% CIRCONFERENZA

%centro circonferenza
centro = [1;0.95;0.5];
%raggio circonferenza
raggio = 0.25;

Plot.Punti();

% theta1 = pi+0.6435; theta2 = theta1+1.8546;
% theta3 = theta2; theta4 = theta3+pi/2+0.6435;
% theta5 = pi/2; theta6 = theta5+pi/2+0.6435;

h=0.15; angle=asin(h/raggio);
% arco P1->P2
theta1=angle+pi; diff = (3*(pi/2))-theta1; theta2 = (2*diff)+theta1;
[P1P2arco, P1P2arcoDerivata, Q1Q2arco, Q1Q2arcoDerivata] = Percorso.Arco(theta1,theta2);
% arco P2->P3
theta3=theta2; theta4=theta3+(pi/2)+angle;
[P2P3arco, P2P3arcoDerivata, Q2Q3arco, Q2Q3arcoDerivata] = Percorso.Arco(theta3, theta4);
% arco P3->P1
theta5=theta4; theta6=theta5+(pi/2)+angle;
[P3P1arco, P3P1arcoDerivata, Q3Q1arco, Q3Q1arcoDerivata] = Percorso.Arco(theta5, theta6);
grid on; xlabel('X'); ylabel('Y'); zlabel('Z');

%% ERRORE circonferenza
Errore.Circonferenza(P1P2arco, Q1Q2arco, P2P3arco, Q2Q3arco, P3P1arco, Q3Q1arco);

%% PLOT PERCORSO CIRCONFERENZA
Plot.Circonferenza(P1P2arco, P2P3arco, P3P1arco);

Plot.VariabiliDiGiuntoCirconferenza(Q1Q2arco, Q2Q3arco, Q3Q1arco);
Plot.VariabiliDiGiuntoDerivataCirconferenza(Q1Q2arcoDerivata, Q2Q3arcoDerivata, Q3Q1arcoDerivata);
Plot.VelocitaCoperturaCirconferenza(P1P2arcoDerivata, P2P3arcoDerivata, P3P1arcoDerivata);


%% PLOT CON TEMPO
Plot.Triangolo40Secondi(Q1Q2segmento, P1P2segmento, Q2Q3segmento, P2P3segmento, Q3Q1segmento, P3P1segmento);
Plot.Circonferenza40Secondi(Q1Q2arco, P1P2arco, Q2Q3arco, P2P3arco, Q3Q1arco, P3P1arco);
