clear; close all; clc;

%% CONFIGURAZIONE PUMA560

link1 = 0; link2 = 0.9; link3 = 0.9;
links = [link1 link2 link3];

alpha1 = pi/2; alpha2 = 0; alpha3 = 0;
alphas = [alpha1 alpha2 alpha3];

d1 = 0.35; d2 = 0; d3 = 0;
ds = [d1 d2 d3];

theta1 = 0; theta2 = 0; theta3 = 0;
thetas = [theta1 theta2 theta3];

R0b = [1 0 0 0.5;0 1 0 0.5;0 0 1 1;0 0 0 1];


%% CREAZIONE ROBOT
puma560 = PUMA560Configuration(links, alphas, ds, thetas, R0b);

puma560.LINK1 = Link( [puma560.theta1, puma560.d1, puma560.link1, puma560.alpha1, PUMA560Configuration.revolute], 'standard' );
puma560.LINK2 = Link( [puma560.theta2, puma560.d2, puma560.link2, puma560.alpha2, PUMA560Configuration.revolute], 'standard' );
puma560.LINK3 = Link( [puma560.theta3, puma560.d3, puma560.link3, puma560.alpha3, PUMA560Configuration.revolute], 'standard' );

LINKS = [puma560.LINK1 puma560.LINK2 puma560.LINK3];
robot = SerialLink(LINKS, 'name', 'PUMA 560');
            
figure();
robot.plot( [puma560.theta1 puma560.theta2 puma560.theta3] );

%% PUNTI

P1 = [0.8 0.8 0.5]';
P2 = [1.2 0.8 0.5]';
P3 = [1.0 1.2 0.5]';

Q1 = CinematicaInversa(links, P1);
Q2 = CinematicaInversa(links, P2);
Q3 = CinematicaInversa(links, P3);


%% CINEMATICA DIRETTA
T03 = CinematicaDiretta(links, thetas);