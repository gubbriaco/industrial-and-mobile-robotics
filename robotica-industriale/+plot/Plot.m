classdef Plot

    methods(Static)
        
        function points()
            global P1 P2 P3
            figure();
            plot3(P1(1), P1(2), P1(3), 'o', 'Color', 'red'); hold on;
            plot3(P2(1), P2(2), P2(3), 'o', 'Color', 'red'); hold on;
            plot3(P3(1), P3(2), P3(3), 'o', 'Color', 'red');
        end
        
        function variabili_di_giunto_triangolo(Q1Q2_segment, Q2Q3_segment, Q3Q1_segment)
            global t12 t23 t31;
            figure();
            plot(t12, Q1Q2_segment(:,1),'Color', 'b'); hold on;plot(t12, Q1Q2_segment(:,2),'Color', 'r'); hold on;plot(t12, Q1Q2_segment(:,3),'Color', 'g'); hold on;
            plot(t23,  Q2Q3_segment(:,1),'Color', 'b'); hold on;plot(t23, Q2Q3_segment(:,2),'Color', 'r'); hold on;plot(t23, Q2Q3_segment(:,3),'Color', 'g'); hold on;
            plot(t31,  Q3Q1_segment(:,1),'Color', 'b'); hold on;plot(t31, Q3Q1_segment(:,2),'Color', 'r'); hold on;plot(t31, Q3Q1_segment(:,3),'Color', 'g'); hold on;
            plot(t12, Q1Q2_segment(:,1),'*','Color', 'b'); hold on;plot(t12, Q1Q2_segment(:,2),'*','Color', 'r'); hold on;plot(t12, Q1Q2_segment(:,3),'*','Color', 'g'); hold on;
            plot(t23,  Q2Q3_segment(:,1),'*','Color', 'b'); hold on;plot(t23, Q2Q3_segment(:,2),'*','Color', 'r'); hold on;plot(t23, Q2Q3_segment(:,3),'*','Color', 'g'); hold on;
            plot(t31,  Q3Q1_segment(:,1),'*','Color', 'b'); hold on;plot(t31, Q3Q1_segment(:,2),'*','Color', 'r'); hold on;plot(t31,  Q3Q1_segment(:,3),'*','Color', 'g'); hold on;
            title("VARIABILI DI GIUNTO percorso triangolo"); xlabel("\lambda"); ylabel("variabili di giunto"); legend('Q1Q2','Q2Q3','Q3Q1'); grid;
        end
        
        function variabili_di_giunto_derivata_triangolo(Q1Q2_segment_derived, Q2Q3_segment_derived, Q3Q1_segment_derived)
            global t12 t23 t31;
            figure();
            plot(t12, Q1Q2_segment_derived(:,1),'Color', 'b'); hold on;plot(t12, Q1Q2_segment_derived(:,2),'Color', 'r'); hold on;plot(t12, Q1Q2_segment_derived(:,3),'Color', 'g'); hold on;
            plot(t23,  Q2Q3_segment_derived(:,1),'Color', 'b'); hold on;plot(t23, Q2Q3_segment_derived(:,2),'Color', 'r'); hold on;plot(t23, Q2Q3_segment_derived(:,3),'Color', 'g'); hold on;
            plot(t31,  Q3Q1_segment_derived(:,1),'Color', 'b'); hold on;plot(t31, Q3Q1_segment_derived(:,2),'Color', 'r'); hold on;plot(t31, Q3Q1_segment_derived(:,3),'Color', 'g'); hold on;
            plot(t12, Q1Q2_segment_derived(:,1),'*','Color', 'b'); hold on;plot(t12, Q1Q2_segment_derived(:,2),'*','Color', 'r'); hold on;plot(t12, Q1Q2_segment_derived(:,3),'*','Color', 'g'); hold on;
            plot(t23,  Q2Q3_segment_derived(:,1),'*','Color', 'b'); hold on;plot(t23, Q2Q3_segment_derived(:,2),'*','Color', 'r'); hold on;plot(t23, Q2Q3_segment_derived(:,3),'*','Color', 'g'); hold on;
            plot(t31,  Q3Q1_segment_derived(:,1),'*','Color', 'b'); hold on;plot(t31, Q3Q1_segment_derived(:,2),'*','Color', 'r'); hold on;plot(t31, Q3Q1_segment_derived(:,3),'*','Color', 'g'); hold on;
            title("VELOCITA' GIUNTI percorso triangolo"); xlabel("\lambda"); ylabel("velocita' variabili di giunto"); legend('Q1Q2d','Q2Q3d','Q3Q1d'); grid;
        end
        
        function velocita_copertura_triangolo(P1P2_segment_derived, P2P3_segment_derived, P3P1_segment_derived)
            global t12 t23 t31;
            figure(); 
            plot(t12, P1P2_segment_derived(:,1),'Color', 'b'); hold on;plot(t12, P1P2_segment_derived(:,2),'Color', 'r'); hold on;plot(t12, P1P2_segment_derived(:,3),'Color', 'g'); hold on;
            plot(t23, P2P3_segment_derived(:,1),'Color', 'b'); hold on;plot(t23, P2P3_segment_derived(:,2),'Color', 'r'); hold on;plot(t23, P2P3_segment_derived(:,3),'Color', 'g'); hold on;
            plot(t31, P3P1_segment_derived(:,1),'Color', 'b'); hold on;plot(t31, P3P1_segment_derived(:,2),'Color', 'r'); hold on;plot(t31, P3P1_segment_derived(:,3),'Color', 'g'); hold on;
            plot(t12, P1P2_segment_derived(:,1),'*','Color', 'b'); hold on;plot(t12, P1P2_segment_derived(:,2),'*','Color', 'r'); hold on;plot(t12, P1P2_segment_derived(:,3),'*','Color', 'g'); hold on;
            plot(t23, P2P3_segment_derived(:,1),'*','Color', 'b'); hold on;plot(t23, P2P3_segment_derived(:,2),'*','Color', 'r'); hold on;plot(t23, P2P3_segment_derived(:,3),'*','Color', 'g'); hold on;
            plot(t31, P3P1_segment_derived(:,1),'*','Color', 'b'); hold on;plot(t31, P3P1_segment_derived(:,2),'*','Color', 'r'); hold on;plot(t31, P3P1_segment_derived(:,3),'*','Color', 'g'); hold on;
            title("VELOCITA' DI COPERTURA percorso triangolo"); xlabel("\lambda"); ylabel("velocita'"); legend('P1P2d','P2P3d','P3P1d'); grid;
        end
        
        
        
        function variabili_di_giunto_circonferenza(Q1Q2_arch, Q2Q3_arch, Q3Q1_arch)
            global t12 t23 t31;
            figure();
            plot(t12, Q1Q2_arch(:,1),'Color', 'b'); hold on;plot(t12, Q1Q2_arch(:,2),'Color', 'r'); hold on;plot(t12, Q1Q2_arch(:,3),'Color', 'g'); hold on;
            plot(t23, Q2Q3_arch(:,1),'Color', 'b'); hold on;plot(t23, Q2Q3_arch(:,2),'Color', 'r'); hold on;plot(t23, Q2Q3_arch(:,3),'Color', 'g'); hold on;
            plot(t31, Q3Q1_arch(:,1),'Color', 'b'); hold on;plot(t31, Q3Q1_arch(:,2),'Color', 'r'); hold on;plot(t31, Q3Q1_arch(:,3),'Color', 'g'); hold on;
            plot(t12, Q1Q2_arch(:,1),'*','Color', 'b'); hold on;plot(t12, Q1Q2_arch(:,2),'*','Color', 'r'); hold on;plot(t12, Q1Q2_arch(:,3),'*','Color', 'g'); hold on;
            plot(t23, Q2Q3_arch(:,1),'*','Color', 'b'); hold on;plot(t23, Q2Q3_arch(:,2),'*','Color', 'r'); hold on;plot(t23, Q2Q3_arch(:,3),'*','Color', 'g'); hold on;
            plot(t31, Q3Q1_arch(:,1),'*','Color', 'b'); hold on;plot(t31, Q3Q1_arch(:,2),'*','Color', 'r'); hold on;plot(t31, Q3Q1_arch(:,3),'*','Color', 'g'); hold on;
            title("VARIABILI DI GIUNTO percorso circonferenza"); xlabel("\lambda"); ylabel("variabili di giunto"); legend('Q1Q2','Q2Q3','Q3Q1'); grid;
        end
        
        function variabili_di_giunto_derivata_circonferenza(Q1Q2_arch_derived, Q2Q3_arch_derived, Q3Q1_arch_derived)
            global t12 t23 t31;
            figure();
            plot(t12, Q1Q2_arch_derived(:,1),'Color', 'b'); hold on;plot(t12, Q1Q2_arch_derived(:,2),'Color', 'r'); hold on;plot(t12, Q1Q2_arch_derived(:,3),'Color', 'g'); hold on;
            plot(t23, Q2Q3_arch_derived(:,1),'Color', 'b'); hold on;plot(t23, Q2Q3_arch_derived(:,2),'Color', 'r'); hold on;plot(t23, Q2Q3_arch_derived(:,3),'Color', 'g'); hold on;
            plot(t31, Q3Q1_arch_derived(:,1),'Color', 'b'); hold on;plot(t31, Q3Q1_arch_derived(:,2),'Color', 'r'); hold on;plot(t31, Q3Q1_arch_derived(:,3),'Color', 'g'); hold on;
            plot(t12, Q1Q2_arch_derived(:,1),'*','Color', 'b'); hold on;plot(t12, Q1Q2_arch_derived(:,2),'*','Color', 'r'); hold on;plot(t12, Q1Q2_arch_derived(:,3),'*','Color', 'g'); hold on;
            plot(t23, Q2Q3_arch_derived(:,1),'*','Color', 'b'); hold on;plot(t23, Q2Q3_arch_derived(:,2),'*','Color', 'r'); hold on;plot(t23, Q2Q3_arch_derived(:,3),'*','Color', 'g'); hold on;
            plot(t31, Q3Q1_arch_derived(:,1),'*','Color', 'b'); hold on;plot(t31, Q3Q1_arch_derived(:,2),'*','Color', 'r'); hold on;plot(t31, Q3Q1_arch_derived(:,3),'*','Color', 'g'); hold on;
            title("VELOCITA' GIUNTI percorso circonferenza"); xlabel("\lambda"); ylabel("velocita' variabili di giunto"); legend('Q1Q2d','Q2Q3d','Q3Q1d'); grid;
        end
        
        function velocita_copertura_circonferenza(P1P2_arch_derived, P2P3_arch_derived, P3P1_arch_derived)
            global t12 t23 t31;
            figure(); 
            plot(t12, P1P2_arch_derived(:,1),'Color', 'b'); hold on;plot(t12, P1P2_arch_derived(:,2),'Color', 'r'); hold on;plot(t12, P1P2_arch_derived(:,3),'Color', 'g'); hold on;
            plot(t23, P2P3_arch_derived(:,1),'Color', 'b'); hold on;plot(t23, P2P3_arch_derived(:,2),'Color', 'r'); hold on;plot(t23, P2P3_arch_derived(:,3),'Color', 'g'); hold on;
            plot(t31, P3P1_arch_derived(:,1),'Color', 'b'); hold on;plot(t31, P3P1_arch_derived(:,2),'Color', 'r'); hold on;plot(t31, P3P1_arch_derived(:,3),'Color', 'g'); hold on;
            plot(t12, P1P2_arch_derived(:,1),'*','Color', 'b'); hold on;plot(t12, P1P2_arch_derived(:,2),'*','Color', 'r'); hold on;plot(t12, P1P2_arch_derived(:,3),'*','Color', 'g'); hold on;
            plot(t23, P2P3_arch_derived(:,1),'*','Color', 'b'); hold on;plot(t23, P2P3_arch_derived(:,2),'*','Color', 'r'); hold on;plot(t23, P2P3_arch_derived(:,3),'*','Color', 'g'); hold on;
            plot(t31, P3P1_arch_derived(:,1),'*','Color', 'b'); hold on;plot(t31, P3P1_arch_derived(:,2),'*','Color', 'r'); hold on;plot(t31, P3P1_arch_derived(:,3),'*','Color', 'g'); hold on;
            title("VELOCITA' percorso circonferenza"); xlabel("\lambda"); ylabel("velocita'"); legend('P1P2d','P2P3d','P3P1d'); grid;
        end
        
        
        
        function triangle(P1P2_segment, P2P3_segment, P3P1_segment )
            figure();
            plot3(P1P2_segment(:,1),P1P2_segment(:,2),P1P2_segment(:,3),'*','Color','b'); hold on;
            plot3(P2P3_segment(:,1),P2P3_segment(:,2),P2P3_segment(:,3),'*','Color','r'); hold on;
            plot3(P3P1_segment(:,1),P3P1_segment(:,2),P3P1_segment(:,3),'*','Color','g'); hold on;
            plot3(P1P2_segment(:,1),P1P2_segment(:,2),P1P2_segment(:,3),'Color','b'); hold on;
            plot3(P2P3_segment(:,1),P2P3_segment(:,2),P2P3_segment(:,3),'Color','r'); hold on;
            plot3(P3P1_segment(:,1),P3P1_segment(:,2),P3P1_segment(:,3),'Color','g');
            title("TRIANGOLO"); legend('P1->P2','P2->P3','P3->P1');grid on;

        end
        
        function circumference(P1P2_arch, P2P3_arch, P3P1_arch)
            figure();
            plot3(P1P2_arch(1,:),P1P2_arch(2,:),P1P2_arch(3,:),'*','Color','b'); hold on;
            plot3(P2P3_arch(1,:),P2P3_arch(2,:),P2P3_arch(3,:),'*','Color','r'); hold on;
            plot3(P3P1_arch(1,:),P3P1_arch(2,:),P3P1_arch(3,:),'*','Color','g'); hold on;
            plot3(P1P2_arch(1,:),P1P2_arch(2,:),P1P2_arch(3,:),'Color','b'); hold on;
            plot3(P2P3_arch(1,:),P2P3_arch(2,:),P2P3_arch(3,:),'Color','r'); hold on;
            plot3(P3P1_arch(1,:),P3P1_arch(2,:),P3P1_arch(3,:),'Color','g');
            title("CIRCONFERENZA"); legend('P1->P2','P2->P3','P3->P1');grid on;
        end
    
        function segment(i, PP, QQ)
              global robot;
              plot3(PP(:,1), PP(:,2), PP(:,3), '>', 'Color', 'b'); hold on;
              robot.plot(QQ(i,:));
        end
       
        
        function arch(i, PP, QQ)
            global robot;
            plot3(PP(1,:), PP(2,:), PP(3,:), '>', 'Color', 'b'); hold on;
            robot.plot(QQ(i,:));
        end

        
        function triangle40sec(Q1Q2_segment, P1P2_segment, Q2Q3_segment, P2P3_segment, Q3Q1_segment, P3P1_segment)
            global robot;
            figure();
            title('COPERTURA PERCORSO TRIANGOLO in circa 40sec');
            Q1Q2_segment = Q1Q2_segment';
            Qstart12SEGMENTO = Q1Q2_segment(:,1);
            Qend12SEGMENTO = Q1Q2_segment(:,length(Q1Q2_segment));
            [Q12SEGMENTO,Q12D,Q12DD] = jtraj(Qstart12SEGMENTO, Qend12SEGMENTO, 45);
            robot.plot(Q12SEGMENTO); hold on;
            plot3(P1P2_segment(:,1),P1P2_segment(:,2),P1P2_segment(:,3),'LineWidth',1); hold on;

            Q2Q3_segment = Q2Q3_segment';
            Qstart23SEGMENTO = Q2Q3_segment(:,1);
            Qend23SEGMENTO = Q2Q3_segment(:,length(Q2Q3_segment));
            [Q23SEGMENTO,Q23D,Q23DD] = jtraj(Qstart23SEGMENTO, Qend23SEGMENTO, 45);
            robot.plot(Q23SEGMENTO); hold on;
            plot3(P2P3_segment(:,1),P2P3_segment(:,2),P2P3_segment(:,3),'LineWidth',1); hold on;

            Q3Q1_segment = Q3Q1_segment';
            Qstart31SEGMENTO = Q3Q1_segment(:,1);
            Qend31SEGMENTO = Q3Q1_segment(:,length(Q3Q1_segment));
            [Q31SEGMENTO,Q31D,Q31DD] = jtraj(Qstart31SEGMENTO, Qend31SEGMENTO, 45);
            robot.plot(Q31SEGMENTO); hold on;
            plot3(P3P1_segment(:,1),P3P1_segment(:,2),P3P1_segment(:,3),'LineWidth',1); hold on;
        end
        
        function circumference40sec(Q1Q2_arch, P1P2_arch, Q2Q3_arch, P2P3_arch, Q3Q1_arch, P3P1_arch)
            global robot;
            figure();
            title('COPERTURA PERCORSO CIRCONFERENZA in circa 40sec');
            Q1Q2_arch = Q1Q2_arch';
            Qstart12ARCO = Q1Q2_arch(:,1);
            Qend12ARCO = Q1Q2_arch(:,length(Q1Q2_arch));
            [Q12ARCO,Q12D,Q12DD] = jtraj(Qstart12ARCO, Qend12ARCO, 45);
            robot.plot(Q12ARCO); hold on;
            plot3(P1P2_arch(1,:),P1P2_arch(2,:),P1P2_arch(3,:),'LineWidth',1); hold on;

            Q2Q3_arch = Q2Q3_arch';
            Qstart23ARCO = Q2Q3_arch(:,1);
            Qend23ARCO = Q2Q3_arch(:,length(Q2Q3_arch));
            [Q23ARCO,Q23D,Q23DD] = jtraj(Qstart23ARCO, Qend23ARCO, 45);
            robot.plot(Q23ARCO); hold on;
            plot3(P2P3_arch(1,:),P2P3_arch(2,:),P2P3_arch(3,:),'LineWidth',1); hold on;

            Q3Q1_arch = Q3Q1_arch';
            Qstart31ARCO = Q3Q1_arch(:,1);
            Qend31ARCO = Q3Q1_arch(:,length(Q3Q1_arch));
            [Q31ARCO,Q31D,Q31DD] = jtraj(Qstart31ARCO, Qend31ARCO, 45);
            robot.plot(Q31ARCO); hold on;
            plot3(P3P1_arch(1,:),P3P1_arch(2,:),P3P1_arch(3,:),'LineWidth',1); hold on;
        end
    
    end

end