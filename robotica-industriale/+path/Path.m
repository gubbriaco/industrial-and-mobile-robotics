classdef Path

    methods(Static)
    
        function [PP, PPd, QQ, QQd] = segment(T1, T2, P1, P2, Q1, Q2)
            global links lambda lambdad;
            import cinematica.cinematica_inversa.cinematica_inversa;
            import plot.Plot;
            import jacobian.geometric_jacobian;
            N = length(lambda);
            for i=1:N
                % percorso lineare
                P = P1+lambda(i)*(P2-P1);
                Q = cinematica_inversa(links, P);
                %Q = Q1+lambda(i)*(Q2-Q1);

                %definisco le variabili che mi serviranno per i grafici
                %corrispondono alle variazioni delle var. dei giunti e dei punti
                %raggiunti
                QQ(i,:) = Q;
                PP(i,:) = P;
                
                Plot.segment(i, PP, QQ);
                
                % calcolare J(Q)
                JP = geometric_jacobian(links,[Q1 Q2]);
                
                % risolvere il sistema di eq. lineari J(Q)*Qd=Pd
                Pd = (P2-P1)*lambdad(i) / (T2-T1);
                PPd(i,:) = Pd;
                
                if( isequal(det(JP), 0) )
                    error("Singolarita' cinematica");
                else
                    Qd = inv(JP) * Pd;
                end
                
                QQd(i,:) = Qd;
            end
        end

        
        function [PP, PPd, QQ, QQd] = arch(theta1, theta2)
            global links lambda lambdad radius_circumference center_circumference;
            import cinematica.cinematica_inversa.cinematica_inversa;
            import plot.Plot;
            import jacobian.geometric_jacobian;
            N = length(lambda);
            for i=1:N 
                theta = theta1 + lambda(i)*(theta2-theta1);
                PP(:,i) = center_circumference + ...
                            radius_circumference*[cos(theta);sin(theta);0];
                QQ(i,:) = cinematica_inversa(links, PP(:,i));
                
                Plot.arch(i, PP, QQ);

                PPd(:,i) = radius_circumference*[-sin(theta) ; cos(theta) ; 0] ...
                                            * lambdad(i) * (theta2-theta1);
                JP = geometric_jacobian(links,[QQ(i,1) QQ(i,2) QQ(i,3)]);
                
                if( isequal(det(JP), 0) )
                    error("Singolarita' cinematica");
                else
                    QQd(:,i) = inv(JP) * PPd(:,i);
                end
            end
        end
    
    
    end
    
end