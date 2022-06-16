clear; close all; clc;

%% CONFIGURAZIONE PUMA560

link1 = 0; link2 = 0.9; link3 = 0.9;
links = [link1 link2 link3];

alpha1 = pi/2; alpha2 = 0; alpha3 = 0;
alphas = [alpha1 alpha2 alpha3];

d1 = 0; d2 = 0; d3 = 0;
ds = [d1 d2 d3];

theta1 = 0; theta2 = 0; theta3 = 0;
thetas = [theta1 theta2 theta3];

R0b = [
    [1 0 0 0.5]
    [0 1 0 0.5]
    [0 0 1 1]
    [0 0 0 1]
    ];


%% CREAZIONE ROBOT
puma560 = PUMA560Configuration(links, alphas, ds, thetas);

puma560 = puma560.SistemaRiferimentoMatriceRotoTraslazione(R0b);

revolute = 0; prismatic = 1;
puma560.LINK1Type(prismatic);
puma560.LINK2Type(revolute);
puma560.LINK1Type(revolute);

PUMA560Configuration.PUMA560plot();