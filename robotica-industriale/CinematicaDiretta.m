

%% CONFIGURAZIONE PUMA560

link1 = 0;
link2 = 0.9;
link3 = 0.9;

alpha1 = pi/2; 
alpha2 = 0; 
alpha3 = 0;
alpha = [alpha1 alpha2 alpha3]';

d1 = 0; 
d2 = 0; 
d3 = 0;

theta1 = 0;
theta2 = 0;
theta3 = 0;
theta = [theta1 theta2 theta3];

%% Legame tra i sistemi di riferimento (0) e (b) -> matrice di roto-traslazione

R0b = [
    [1 0 0 0.5]
    [0 1 0 0.5]
    [0 0 1 1]
    [0 0 0 1]
    ];


%% CINEMATICA DIRETTA




