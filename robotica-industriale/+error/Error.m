classdef Error

    methods(Static)
    
        
        function triangle()
            global links sigma t12 t23 t31
            global P1P2_segment P2P3_segment P3P1_segment
            global Q1Q2_segment Q2Q3_segment Q3Q1_segment
            figure();
            N = length(sigma);
            import kinematics.direct_kinematics.direct_kinematics;
            for i = 1 : N
                pos12 = direct_kinematics(links, [Q1Q2_segment(i,1) Q1Q2_segment(i,2) Q1Q2_segment(i,3)]);
                endEffector(:,i) = pos12(1:3,4);
                E12(i) = 0.5*(norm(P1P2_segment(i,:)' - endEffector(:,i))^2);

                pos23 = direct_kinematics(links, [Q2Q3_segment(i,1) Q2Q3_segment(i,2) Q2Q3_segment(i,3)]);
                endEffector(:,i) = pos23(1:3,4);
                E23(i) = 0.5*(norm(P2P3_segment(i,:)' - endEffector(:,i))^2);

                pos31 = direct_kinematics(links, [Q3Q1_segment(i,1) Q3Q1_segment(i,2) Q3Q1_segment(i,3)]);
                endEffector(:,i) = pos31(1:3,4);
                E31(i) = 0.5*(norm(P3P1_segment(i,:)' - endEffector(:,i))^2);
            end
            plot(t12,E12); hold on;
            plot(t23,E23); hold on;
            plot(t31,E31);
            grid; xlabel("\sigma"); ylabel("error"); title("TRIANGLE ERROR");
        end
        
        
        function Circonferenza(P1P2arco, Q1Q2arco, P2P3arco, Q2Q3arco, P3P1arco, Q3Q1arco)
            global links sigma t12 t23 t31;
            figure();
            for i=1:length(sigma)
                pos12 = CinematicaDiretta(links, [Q1Q2arco(i,1) Q1Q2arco(i,2) Q1Q2arco(i,3)]);
                endEffector(:,i) = pos12(1:3,4);
                E12(i) = 0.5*(norm(P1P2arco(:,i) - endEffector(:,i))^2);

                pos23 = CinematicaDiretta(links, [Q2Q3arco(i,1) Q2Q3arco(i,2) Q2Q3arco(i,3)]);
                endEffector(:,i) = pos23(1:3,4);
                E23(i) = 0.5*(norm(P2P3arco(:,i) - endEffector(:,i))^2);

                pos31 = CinematicaDiretta(links, [Q3Q1arco(i,1) Q3Q1arco(i,2) Q3Q1arco(i,3)]);
                endEffector(:,i) = pos31(1:3,4);
                E31(i) = 0.5*(norm(P3P1arco(:,i) - endEffector(:,i))^2);
            end
            plot(t12,E12); hold on;
            plot(t23,E23); hold on;
            plot(t31,E31);
            grid; xlabel("\sigma"); ylabel("Errore"); title("Errore Circonferenza");
        end
        
    
    end

end