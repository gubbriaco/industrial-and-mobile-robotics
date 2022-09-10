function [T] = time_definition()

    TEMPO_TOTALE = 40;
    % P1->P2 t2-t1 40/3
    % P2->P3 t3-t2 40/3
    % P3->P1 t4-t3 40/3
    
    T1 = 0;
    T2 = T1+(TEMPO_TOTALE/3);
    T3 = T2+(TEMPO_TOTALE/3);
    T4 = T3+(TEMPO_TOTALE/3);

    %definisco il tempo
    global t12 t23 t31 lambda
    t12 = T1 + lambda*(T2-T1);
    t23 = T2 + lambda*(T3-T2);
    t31 = T3 + lambda*(T4-T3);


    T = [T1 T2 T3 T4];

end