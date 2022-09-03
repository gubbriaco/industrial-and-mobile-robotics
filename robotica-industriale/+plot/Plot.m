classdef Plot

    methods(Static)
        

        function points()
            % function che effettua il plot dei punti P1, P2 e P3
            global P1 P2 P3
            figure();
            plot3(P1(1), P1(2), P1(3), "o", "Color","red"); hold on;
            plot3(P2(1), P2(2), P2(3), "o", "Color","red"); hold on;
            plot3(P3(1), P3(2), P3(3), "o", "Color","red"); 
        end
        
        function triangle_joint_variables()
            % function che effettua il plot dell'andamento delle variabili 
            % di giunto riguardo il percorso del triangolo
            global t12 t23 t31
            global Q1Q2_segment Q2Q3_segment Q3Q1_segment
            figure();
            plot(t12, Q1Q2_segment(:,1), "Color","b"); hold on;
            plot(t12, Q1Q2_segment(:,2), "Color","r"); hold on;
            plot(t12, Q1Q2_segment(:,3), "Color","g"); hold on;
            plot(t23, Q2Q3_segment(:,1), "Color","b"); hold on;
            plot(t23, Q2Q3_segment(:,2), "Color","r"); hold on;
            plot(t23, Q2Q3_segment(:,3), "Color","g"); hold on;
            plot(t31, Q3Q1_segment(:,1), "Color","b"); hold on;
            plot(t31, Q3Q1_segment(:,2), "Color","r"); hold on;
            plot(t31, Q3Q1_segment(:,3), "Color","g"); hold on;
            plot(t12, Q1Q2_segment(:,1), "*","Color","b"); hold on;
            plot(t12, Q1Q2_segment(:,2), "*","Color","r"); hold on;
            plot(t12, Q1Q2_segment(:,3), "*","Color","g"); hold on;
            plot(t23, Q2Q3_segment(:,1), "*","Color","b"); hold on;
            plot(t23, Q2Q3_segment(:,2), "*","Color","r"); hold on;
            plot(t23, Q2Q3_segment(:,3), "*","Color","g"); hold on;
            plot(t31, Q3Q1_segment(:,1), "*","Color","b"); hold on;
            plot(t31, Q3Q1_segment(:,2), "*","Color","r"); hold on;
            plot(t31, Q3Q1_segment(:,3), "*","Color","g"); hold on;
            title("TRIANGLE JOINT VARIABLES"); 
            xlabel("\lambda"); ylabel("joint variables"); 
            legend("Q1Q2","Q2Q3","Q3Q1"); grid on;
        end
        
        function triangle_joint_variables_speed()
            % function che effettua il plot dell'andamento delle velocita'
            % delle variabili di giunto riguardo il percorso del triangolo
            global t12 t23 t31
            global Q1Q2_derived_segment Q2Q3_derived_segment Q3Q1_derived_segment
            figure();
            plot(t12, Q1Q2_derived_segment(:,1), "Color","b"); hold on;
            plot(t12, Q1Q2_derived_segment(:,2), "Color","r"); hold on;
            plot(t12, Q1Q2_derived_segment(:,3), "Color","g"); hold on;
            plot(t23, Q2Q3_derived_segment(:,1), "Color","b"); hold on;
            plot(t23, Q2Q3_derived_segment(:,2), "Color","r"); hold on;
            plot(t23, Q2Q3_derived_segment(:,3), "Color","g"); hold on;
            plot(t31, Q3Q1_derived_segment(:,1), "Color","b"); hold on;
            plot(t31, Q3Q1_derived_segment(:,2), "Color","r"); hold on;
            plot(t31, Q3Q1_derived_segment(:,3), "Color","g"); hold on;
            plot(t12, Q1Q2_derived_segment(:,1), "*","Color","b"); hold on;
            plot(t12, Q1Q2_derived_segment(:,2), "*","Color","r"); hold on;
            plot(t12, Q1Q2_derived_segment(:,3), "*","Color","g"); hold on;
            plot(t23, Q2Q3_derived_segment(:,1), "*","Color","b"); hold on;
            plot(t23, Q2Q3_derived_segment(:,2), "*","Color","r"); hold on;
            plot(t23, Q2Q3_derived_segment(:,3), "*","Color","g"); hold on;
            plot(t31, Q3Q1_derived_segment(:,1), "*","Color","b"); hold on;
            plot(t31, Q3Q1_derived_segment(:,2), "*","Color","r"); hold on;
            plot(t31, Q3Q1_derived_segment(:,3), "*","Color","g"); hold on;
            title("TRIANGLE JOINT VARIABLES SPEED"); 
            xlabel("\lambda"); ylabel("joint variables speed"); 
            legend("Q1Q2d","Q2Q3d","Q3Q1d"); grid on;
        end
        
        function triangle_coverage_speed()
            % function che effettua il plot della velocita' con cui viene
            % coperto il percorso del triangolo
            global t12 t23 t31
            global P1P2_derived_segment P2P3_derived_segment P3P1_derived_segment
            figure(); 
            plot(t12, P1P2_derived_segment(:,1), "Color","b"); hold on;
            plot(t12, P1P2_derived_segment(:,2), "Color","r"); hold on;
            plot(t12, P1P2_derived_segment(:,3), "Color","g"); hold on;
            plot(t23, P2P3_derived_segment(:,1), "Color","b"); hold on;
            plot(t23, P2P3_derived_segment(:,2), "Color","r"); hold on;
            plot(t23, P2P3_derived_segment(:,3), "Color","g"); hold on;
            plot(t31, P3P1_derived_segment(:,1), "Color","b"); hold on;
            plot(t31, P3P1_derived_segment(:,2), "Color","r"); hold on;
            plot(t31, P3P1_derived_segment(:,3), "Color","g"); hold on;
            plot(t12, P1P2_derived_segment(:,1), "*","Color","b"); hold on;
            plot(t12, P1P2_derived_segment(:,2), "*","Color","r"); hold on;
            plot(t12, P1P2_derived_segment(:,3), "*","Color","g"); hold on;
            plot(t23, P2P3_derived_segment(:,1), "*","Color","b"); hold on;
            plot(t23, P2P3_derived_segment(:,2), "*","Color","r"); hold on;
            plot(t23, P2P3_derived_segment(:,3), "*","Color","g"); hold on;
            plot(t31, P3P1_derived_segment(:,1), "*","Color","b"); hold on;
            plot(t31, P3P1_derived_segment(:,2), "*","Color","r"); hold on;
            plot(t31, P3P1_derived_segment(:,3), "*","Color","g"); hold on;
            title("TRIANGLE COVERAGE SPEED"); 
            xlabel("\lambda"); ylabel("speed"); 
            legend("P1P2d","P2P3d","P3P1d"); grid on;
        end
        
        
        
        function circumference_joint_variables()
            % function che effettua il plot dell'andamento delle variabili 
            % di giunto riguardo il percorso della circonferenza
            global Q1Q2_arch Q2Q3_arch Q3Q1_arch
            global t12 t23 t31;
            figure();
            plot(t12, Q1Q2_arch(:,1), "Color", "b"); hold on;
            plot(t12, Q1Q2_arch(:,2), "Color", "r"); hold on;
            plot(t12, Q1Q2_arch(:,3), "Color", "g"); hold on;
            plot(t23, Q2Q3_arch(:,1), "Color", "b"); hold on;
            plot(t23, Q2Q3_arch(:,2), "Color", "r"); hold on;
            plot(t23, Q2Q3_arch(:,3), "Color", "g"); hold on;
            plot(t31, Q3Q1_arch(:,1), "Color", "b"); hold on;
            plot(t31, Q3Q1_arch(:,2), "Color", "r"); hold on;
            plot(t31, Q3Q1_arch(:,3), "Color", "g"); hold on;
            plot(t12, Q1Q2_arch(:,1), "*", "Color", "b"); hold on;
            plot(t12, Q1Q2_arch(:,2), "*", "Color", "r"); hold on;
            plot(t12, Q1Q2_arch(:,3), "*", "Color", "g"); hold on;
            plot(t23, Q2Q3_arch(:,1), "*", "Color", "b"); hold on;
            plot(t23, Q2Q3_arch(:,2), "*", "Color", "r"); hold on;
            plot(t23, Q2Q3_arch(:,3), "*", "Color", "g"); hold on;
            plot(t31, Q3Q1_arch(:,1), "*", "Color", "b"); hold on;    
            plot(t31, Q3Q1_arch(:,2), "*", "Color", "r"); hold on;
            plot(t31, Q3Q1_arch(:,3), "*", "Color", "g"); hold on;
            title("CIRCUMFERENCE JOINT VARIABLES"); 
            xlabel("\lambda"); ylabel("joint variables"); 
            legend("Q1Q2","Q2Q3","Q3Q1"); grid on;
        end
        
        function circumference_joint_variables_speed()
            % function che effettua il plot dell'andamento delle velocita'
            % delle variabili di giunto riguardo il percorso della
            % circonferenza
            global t12 t23 t31
            global Q1Q2_derived_arch Q2Q3_derived_arch Q3Q1_derived_arch
            figure();
            plot(t12, Q1Q2_derived_arch(1,:), "Color", "b"); hold on;
            plot(t12, Q1Q2_derived_arch(2,:), "Color", "r"); hold on;
            plot(t12, Q1Q2_derived_arch(3,:), "Color", "g"); hold on;
            plot(t23, Q2Q3_derived_arch(1,:), "Color", "b"); hold on;
            plot(t23, Q2Q3_derived_arch(2,:), "Color", "r"); hold on;
            plot(t23, Q2Q3_derived_arch(3,:), "Color", "g"); hold on;
            plot(t31, Q3Q1_derived_arch(1,:), "Color", "b"); hold on;
            plot(t31, Q3Q1_derived_arch(2,:), "Color", "r"); hold on;
            plot(t31, Q3Q1_derived_arch(3,:), "Color", "g"); hold on;
            plot(t12, Q1Q2_derived_arch(1,:), "*", "Color", "b"); hold on;
            plot(t12, Q1Q2_derived_arch(2,:), "*", "Color", "r"); hold on;
            plot(t12, Q1Q2_derived_arch(3,:), "*", "Color", "g"); hold on;
            plot(t23, Q2Q3_derived_arch(1,:), "*", "Color", "b"); hold on;
            plot(t23, Q2Q3_derived_arch(2,:), "*", "Color", "r"); hold on;
            plot(t23, Q2Q3_derived_arch(3,:), "*", "Color", "g"); hold on;
            plot(t31, Q3Q1_derived_arch(1,:), "*", "Color", "b"); hold on;
            plot(t31, Q3Q1_derived_arch(2,:), "*", "Color", "r"); hold on;
            plot(t31, Q3Q1_derived_arch(3,:), "*", "Color", "g"); hold on;
            title("CIRCUMFERENCE JOINT VARIABLES SPEED"); 
            xlabel("\lambda"); ylabel("joint variables speed"); 
            legend("Q1Q2d","Q2Q3d","Q3Q1d"); grid on;
        end
        
        function circumference_coverage_speed()
            % function che effettua il plot della velocita' con cui viene
            % coperto il percorso della circonferenza
            global t12 t23 t31
            global P1P2_derived_arch P2P3_derived_arch P3P1_derived_arch
            figure(); 
            plot(t12, P1P2_derived_arch(1,:), "Color", "b"); hold on;
            plot(t12, P1P2_derived_arch(2,:), "Color", "r"); hold on;
            plot(t12, P1P2_derived_arch(3,:), "Color", "g"); hold on;
            plot(t23, P2P3_derived_arch(1,:), "Color", "b"); hold on;
            plot(t23, P2P3_derived_arch(2,:), "Color", "r"); hold on;
            plot(t23, P2P3_derived_arch(3,:), "Color", "g"); hold on;
            plot(t31, P3P1_derived_arch(1,:), "Color", "b"); hold on;
            plot(t31, P3P1_derived_arch(2,:), "Color", "r"); hold on;
            plot(t31, P3P1_derived_arch(3,:), "Color", "g"); hold on;
            plot(t12, P1P2_derived_arch(1,:), "*","Color", "b"); hold on;
            plot(t12, P1P2_derived_arch(2,:), "*","Color", "r"); hold on;
            plot(t12, P1P2_derived_arch(3,:), "*","Color", "g"); hold on;
            plot(t23, P2P3_derived_arch(1,:), "*","Color", "b"); hold on;
            plot(t23, P2P3_derived_arch(2,:), "*","Color", "r"); hold on;
            plot(t23, P2P3_derived_arch(3,:), "*","Color", "g"); hold on;
            plot(t31, P3P1_derived_arch(1,:), "*","Color", "b"); hold on;
            plot(t31, P3P1_derived_arch(2,:), "*","Color", "r"); hold on;
            plot(t31, P3P1_derived_arch(3,:), "*","Color", "g"); hold on;
            title("CIRCUMFERENCE COVERAGE SPEED"); 
            xlabel("\lambda"); ylabel("speed"); 
            legend("P1P2d","P2P3d","P3P1d"); grid on;
        end
        
        
        
        function triangle()
            % function che effettua il plot del triangolo
            global P1P2_segment P2P3_segment P3P1_segment
            figure();
            plot3(P1P2_segment(:,1),P1P2_segment(:,2),P1P2_segment(:,3), ...
                                                 '*','Color','b'); hold on;
            plot3(P2P3_segment(:,1),P2P3_segment(:,2),P2P3_segment(:,3), ...
                                                 '*','Color','r'); hold on;
            plot3(P3P1_segment(:,1),P3P1_segment(:,2),P3P1_segment(:,3), ...
                                                 '*','Color','g'); hold on;
            plot3(P1P2_segment(:,1),P1P2_segment(:,2),P1P2_segment(:,3), ...
                                                     'Color','b'); hold on;
            plot3(P2P3_segment(:,1),P2P3_segment(:,2),P2P3_segment(:,3), ...
                                                     'Color','r'); hold on;
            plot3(P3P1_segment(:,1),P3P1_segment(:,2),P3P1_segment(:,3), ...
                                                              'Color','g');
            title("TRIANGLE"); legend('P1->P2','P2->P3','P3->P1');grid on;
        end
        
        function circumference()
            % function che effettua il plot della circonferenza
            global P1P2_arch P2P3_arch P3P1_arch
            figure();
            plot3(P1P2_arch(1,:),P1P2_arch(2,:),P1P2_arch(3,:),'*','Color','b'); hold on;
            plot3(P2P3_arch(1,:),P2P3_arch(2,:),P2P3_arch(3,:),'*','Color','r'); hold on;
            plot3(P3P1_arch(1,:),P3P1_arch(2,:),P3P1_arch(3,:),'*','Color','g'); hold on;
            plot3(P1P2_arch(1,:),P1P2_arch(2,:),P1P2_arch(3,:),'Color','b'); hold on;
            plot3(P2P3_arch(1,:),P2P3_arch(2,:),P2P3_arch(3,:),'Color','r'); hold on;
            plot3(P3P1_arch(1,:),P3P1_arch(2,:),P3P1_arch(3,:),'Color','g');
            title("CIRCUMFERENCE"); legend('P1->P2','P2->P3','P3->P1'); grid on;
        end
    

        function segment(i, PP, QQ)
                % function che effettua il plot del segmento tramite il
                % robot
              global robot;
              plot3(PP(:,1), PP(:,2), PP(:,3), '>', 'Color', 'b'); hold on;
              robot.plot(QQ(i,:));
        end
       
        
        function arch(i, PP, QQ)
            % function che effettua il plot dell'arco tramite il robot
            global robot;
            plot3(PP(1,:), PP(2,:), PP(3,:), '>', 'Color', 'b'); hold on;
            robot.plot(QQ(i,:));
        end

        
        function triangle_40sec()
            % function che effettua il plot della copertura del percorso
            % del triangolo in 40 secondi tramite il robot
            global robot
            global P1P2_segment P2P3_segment P3P1_segment
            global Q1Q2_segment Q2Q3_segment Q3Q1_segment

            figure(); title("TRIANGLE COVERAGE PATH IN 40 SECONDS");

            Q1Q2_segment = Q1Q2_segment';
            Qstart12SEGMENT = Q1Q2_segment(:,1);
            Qend12SEGMENT = Q1Q2_segment(:,length(Q1Q2_segment));
            [Q12SEGMENT,Q12D,Q12DD] = jtraj(Qstart12SEGMENT, Qend12SEGMENT, 45);
            robot.plot(Q12SEGMENT); hold on;
            plot3(P1P2_segment(:,1),P1P2_segment(:,2),P1P2_segment(:,3),"LineWidth",1); 
            hold on;

            Q2Q3_segment = Q2Q3_segment';
            Qstart23SEGMENT = Q2Q3_segment(:,1);
            Qend23SEGMENT = Q2Q3_segment(:,length(Q2Q3_segment));
            [Q23SEGMENT,Q23D,Q23DD] = jtraj(Qstart23SEGMENT, Qend23SEGMENT, 45);
            robot.plot(Q23SEGMENT); hold on;
            plot3(P2P3_segment(:,1),P2P3_segment(:,2),P2P3_segment(:,3),"LineWidth",1);
            hold on;

            Q3Q1_segment = Q3Q1_segment';
            Qstart31SEGMENT = Q3Q1_segment(:,1);
            Qend31SEGMENT = Q3Q1_segment(:,length(Q3Q1_segment));
            [Q31SEGMENT,Q31D,Q31DD] = jtraj(Qstart31SEGMENT, Qend31SEGMENT, 45);
            robot.plot(Q31SEGMENT); hold on;
            plot3(P3P1_segment(:,1),P3P1_segment(:,2),P3P1_segment(:,3),"LineWidth",1); 
            hold on;
        end
        

        function circumference_40sec()
            % function che effettua il plot della copertura del percorso
            % della circonferenza in 40 secondi tramite il robot
            global robot
            global P1P2_arch P2P3_arch P3P1_arch
            global Q1Q2_arch Q2Q3_arch Q3Q1_arch

            figure(); title("CIRCUMFERENCE COVERAGE PATH IN 40 SECONDS");
            
            Q1Q2_arch = Q1Q2_arch';
            Qstart12ARCH = Q1Q2_arch(:,1);
            Qend12ARCH = Q1Q2_arch(:,length(Q1Q2_arch));
            [Q12ARCH,Q12D,Q12DD] = jtraj(Qstart12ARCH, Qend12ARCH, 45);
            robot.plot(Q12ARCH); hold on;
            plot3(P1P2_arch(1,:),P1P2_arch(2,:),P1P2_arch(3,:),"LineWidth",1);
            hold on;

            Q2Q3_arch = Q2Q3_arch';
            Qstart23ARCH = Q2Q3_arch(:,1);
            Qend23ARCH = Q2Q3_arch(:,length(Q2Q3_arch));
            [Q23ARCH,Q23D,Q23DD] = jtraj(Qstart23ARCH, Qend23ARCH, 45);
            robot.plot(Q23ARCH); hold on;
            plot3(P2P3_arch(1,:),P2P3_arch(2,:),P2P3_arch(3,:),"LineWidth",1); 
            hold on;

            Q3Q1_arch = Q3Q1_arch';
            Qstart31ARCH = Q3Q1_arch(:,1);
            Qend31ARCH = Q3Q1_arch(:,length(Q3Q1_arch));
            [Q31ARCH,Q31D,Q31DD] = jtraj(Qstart31ARCH, Qend31ARCH, 45);
            robot.plot(Q31ARCH); hold on;
            plot3(P3P1_arch(1,:),P3P1_arch(2,:),P3P1_arch(3,:),"LineWidth",1);
            hold on;
        end
    

    end

end