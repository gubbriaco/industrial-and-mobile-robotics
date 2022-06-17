function [PP, QQ, Q0] = PercorsoTriangolo(lambda, P1, P2, Q1, Q2)
    N = length(lambda);

    for i=1:N

        % percorso lineare
        P = P1+lambda(i)*(P2-P1);
        
        Q = Q1+lambda(i)*(Q2-Q1);

        %definisco le variabili che mi serviranno per i grafici
        %corrispondono alle variazioni delle var. dei giunti e dei punti
        %raggiunti
        QQ(i,:) = Q;
        PP(i,:) = P;

        %la nuova postura sara' quella trovata da Q con fminsearch
        Q0=Q;
       

    end
 
        
end