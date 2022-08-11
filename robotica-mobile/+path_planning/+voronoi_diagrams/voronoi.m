% 1) [vx,vy]=voronoi
% 2) ripulire [vx,vy] da ostacoli noti
% v = []
% 3) costruisci il grafo a partire dai nodi tramite matrice di adiacenza
% funzione graph MATLAB
% 4 opzionale) applichi algoritmo percorso minimo sul grafo per ottenere il
%              percorso del robot (dijkstra, ...)


clear; clc; close all;

x_start=start(1); y_start=start(2);
x_goal=goal(1); y_goal=goal(2);

