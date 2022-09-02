classdef Path

    methods(Static)
    
        function [PP, PPd, QQ, QQd] = segment(T1, T2, P1, P2, Q1, Q2)
            global links lambda lambdaDerivata;
            N = length(lambda);
            import kinematics.inverse_kinematics.inverse_kinematics;
            import plot.Plot;
            for i=1:N
                % percorso lineare
                P = P1+lambda(i)*(P2-P1);
                Q = inverse_kinematics(links,P);
                %Q = Q1+lambda(i)*(Q2-Q1);

                %definisco le variabili che mi serviranno per i grafici
                %corrispondono alle variazioni delle var. dei giunti e dei punti
                %raggiunti
                QQ(i,:) = Q;
                PP(i,:) = P;
                
                Plot.Segmento(i, PP, QQ);
                
                % calcolare J(Q)
                JP = JacobianoGeometrico(links,[Q1 Q2]);
                
                % risolvere il sistema di eq. lineari J(Q)*Qd=Pd
                Pd = (P2-P1)*lambdaDerivata(i) / (T2-T1);
                PPd(i,:) = Pd;
                
                if( isequal(det(JP), 0) )
                    error("Singolarita' cinematica");
                else
                    Qd = inv(JP) * Pd;
                end
                
                QQd(i,:) = Qd;
            end
        end

        
        function [PP, PPd, QQ, QQd] = Arco(theta1, theta2)
            global links lambda lambdaDerivata raggio centro;
            N = length(lambda);
            for i=1:N 
                theta = theta1 + lambda(i)*(theta2-theta1);
                PP(:,i) = centro + raggio*[cos(theta);sin(theta);0];
                QQ(i,:) = CinematicaInversa(links, PP(:,i));
                
                Plot.Arco(i, PP, QQ);

                PPd(:,i) = raggio*[-sin(theta);cos(theta);0] * lambdaDerivata(i) * (theta2-theta1);
                JP = JacobianoGeometrico(links,[QQ(i,1) QQ(i,2) QQ(i,3)]);
                
                if( isequal(det(JP), 0) )
                    error("Singolarita' cinematica");
                else
                    QQd(:,i) = inv(JP) * PPd(:,i);
                end
            end
        end
    
    
    end
    
end