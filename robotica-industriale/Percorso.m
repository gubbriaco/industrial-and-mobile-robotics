classdef Percorso

    methods(Static)
    
        function [PP, PPd, QQ, QQd] = Triangolo(robot, links, lambda, lambda_d, T1, T2, P1, P2, Q1, Q2)
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
                
                % plot
                plot3(PP(:,1), PP(:,2), PP(:,3), '>', 'Color', 'b'); hold on;
                robot.plot(QQ(i,:));
                
                % calcolare J(Q)
                JP = JacobianoGeometrico(links,[Q1 Q2]);
                
                % risolvere il sistema di eq. lineari J(Q)*Qd=Pd
                Pd = (P2-P1)*lambda_d(i) / (T2-T1);
                PPd(i,:) = Pd;
                Qd = inv(JP) * Pd;
                QQd(i,:) = Qd;
            end
        end

        
        function [PP, QQ, Q0] = Circonferenza(lambda, centro, raggio, P1, P2)
            N = length(lambda);
            for i=1:N
                
                corda = sqrt( ((P2(1)-P1(1))^2) + ((P2(2)-P1(2))^2) + ((P2(3)-P1(3))^2) );
                angoloAlCentro(i) = lambda(i) * 2*asin( corda/(2*raggio) );
                arco(i,:) = P1 + lambda(i)*(P2-P1).*[sin(angoloAlCentro(i));cos(angoloAlCentro(i));0]; 
                %arco(i,:) = centro - (raggio * [cos(angoloAlCentro(i)+(pi/5));sin(angoloAlCentro(i)+(pi/5));0]);

                PP = arco;
                Q(i,:) = angoloAlCentro(i);
                
                %definisco le variabili che mi serviranno per i grafici
                %corrispondono alle variazioni delle var. dei giunti e dei punti
                %raggiunti
                 QQ(i,:) = Q(i,:);
%                 PP(i,:) = P(i,:);

                plot3(arco(:,1), arco(:,2), arco(:,3), '>', 'Color', 'b'); hold on;
%                robot.plot(QQ(i,:));
                
                Q0 = Q;
            end
        end
    
    end

end