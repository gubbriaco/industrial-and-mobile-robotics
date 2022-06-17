classdef Percorso

    methods(Static)
    
        function [PP, QQ, Q0] = Triangolo(lambda, P1, P2, Q1, Q2)
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

        
        function [PP, QQ, Q0] = Circonferenza(links, sigma, centro, raggio)
            N = length(sigma);
            for i=1:N
                theta = sigma(i)*2*pi;
                P(i,:) = centro + raggio * [cos(theta);sin(theta);0];
                Q(i,:) = CinematicaInversa(links, P);
                
                %definisco le variabili che mi serviranno per i grafici
                %corrispondono alle variazioni delle var. dei giunti e dei punti
                %raggiunti
                QQ(i,:) = Q(i,:);
                PP(i,:) = P(i,:);

                Q0 = Q;
            end
        end
    
    end

end