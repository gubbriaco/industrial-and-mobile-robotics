%% CONFIGURAZIONE PUMA560

link1 = 0;
link2 = 0.9;
link3 = 0.9;

alpha1 = pi/2; 
alpha2 = 0; 
alpha3 = 0;

d1 = 0; 
d2 = 0; 
d3 = 0;

%% Legame tra i sistemi di riferimento (0) e (b) -> matrice di roto-traslazione

R0b = [
    [1 0 0 0.5],
    [0 1 0 0.5],
    [0 0 1 1],
    [0 0 0 1]
    ];



