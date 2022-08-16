% Funzione che calcola se esiste un'interesezione tra un segmento la cui x varia da
% xline(1) a xline(2), come anche la y, e un ostacolo di forma rettangolare

function [intersect] = obstacle_intersect_verification(xline,yline,xobst,yobst)

% prendo punto iniziale e finale della x e della y dell'ostacolo
% corrispondente
xobsti = xobst(1); xobstf = xobst(2);
yobsti = yobst(1); yobstf = yobst(2);

% prendo l'insieme di punti (pari a 500 punti) compreso tra l'inizio
% dell'edge di voronoi e la sua fine (sia per le x che per le y)
xline = linspace(xline(1),xline(2),10)';
yline = linspace(yline(1),yline(2),10)';


% se sono lo stesso punto allora li trasformo in un vettore cosi' da
% poterlo confrontare successivamente per verificare se l'edge di voronoi e
% l'ostacolo sono lo stesso punto
if length(xline) == 1
    xline = ones(length(yline),1)*xline;
elseif length(yline) == 1
    yline = ones(length(xline),1)*yline;
end

% vettore logico
% contiene valori booleani per ogni posizione tale che se pari a 1
% significa che e' presente un intersezione tra l'edge di voronoi e
% l'ostacolo
condition = xline > xobsti & xline < xobstf & yline > yobsti & yline < yobstf;


% se sono presenti degli 1 (true) nel vettore logico allora sono presenti
% delle intersezioni

% find(c,1) restituisce il primo booleano per cui è soddisfatta la 
% condizione c
% ~isempty(..) restituisce true se la find ha trovato quel booleano, false
% altrimenti
intersect = ~isempty(find(condition,1));

end
