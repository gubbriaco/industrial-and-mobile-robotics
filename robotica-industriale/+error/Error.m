classdef Error

    methods(Static)
    
        
        function triangle()
            global links sigma t12 t23 t31
            global P1P2_segment P2P3_segment P3P1_segment
            global Q1Q2_segment Q2Q3_segment Q3Q1_segment
            N = length(sigma);
            import kinematics.direct_kinematics.direct_kinematics;
            for i = 1 : N
                pos12 = direct_kinematics(links, [Q1Q2_segment(i,1) Q1Q2_segment(i,2) Q1Q2_segment(i,3)]);
                endEffector(:,i) = pos12(1:3,4);
                endEffector12(:,i)=endEffector(:,i);
                E12(i) = 0.5*(norm(P1P2_segment(i,:)' - endEffector(:,i))^2);

                pos23 = direct_kinematics(links, [Q2Q3_segment(i,1) Q2Q3_segment(i,2) Q2Q3_segment(i,3)]);
                endEffector(:,i) = pos23(1:3,4);
                endEffector23(:,i)=endEffector(:,i);
                E23(i) = 0.5*(norm(P2P3_segment(i,:)' - endEffector(:,i))^2);

                pos31 = direct_kinematics(links, [Q3Q1_segment(i,1) Q3Q1_segment(i,2) Q3Q1_segment(i,3)]);
                endEffector(:,i) = pos31(1:3,4);
                endEffector31(:,i)=endEffector(:,i);
                E31(i) = 0.5*(norm(P3P1_segment(i,:)' - endEffector(:,i))^2);
            end
            
            figure();
            plot3(P1P2_segment(:,1),P1P2_segment(:,2),P1P2_segment(:,3), ...
                                                 '>', "Color","black"); hold on;
            plot3(P2P3_segment(:,1),P2P3_segment(:,2),P2P3_segment(:,3), ...
                                                 '>', "Color","black"); hold on;
            plot3(P3P1_segment(:,1),P3P1_segment(:,2),P3P1_segment(:,3), ...
                                                 '>', "Color","black"); hold on;
            hold on; 
            for i = 1 : N
                endeff = endEffector12(:,i);
                plot3(endeff(1),endeff(2),endeff(3), "+", 'Color','#e69832');
                hold on;
                endeff = endEffector23(:,i);
                plot3(endeff(1),endeff(2),endeff(3), "+", 'Color','#e69832');
                hold on;
                endeff = endEffector31(:,i);
                plot3(endeff(1),endeff(2),endeff(3), "+", 'Color','#e69832');
                hold on;
            end
            grid on; title("END EFFECTOR TRIANGLE COVERAGE");
            
            figure();
            plot(t12,E12); hold on;
            plot(t23,E23); hold on;
            plot(t31,E31);
            grid on; xlabel("\sigma"); ylabel("error"); 
            title("TRIANGLE ERROR");
        end
        
        
        function circumference()
            global links sigma t12 t23 t31
            global P1P2_arch P2P3_arch P3P1_arch
            global Q1Q2_arch Q2Q3_arch Q3Q1_arch
            import kinematics.direct_kinematics.direct_kinematics;
            N = length(sigma);
            for i = 1 : N
                pos12 = direct_kinematics(links, [Q1Q2_arch(i,1) Q1Q2_arch(i,2) Q1Q2_arch(i,3)]);
                endEffector(:,i) = pos12(1:3,4);
                endEffector12(:,i)=endEffector(:,i);
                E12(i) = 0.5*(norm(P1P2_arch(:,i) - endEffector(:,i))^2);

                pos23 = direct_kinematics(links, [Q2Q3_arch(i,1) Q2Q3_arch(i,2) Q2Q3_arch(i,3)]);
                endEffector(:,i) = pos23(1:3,4);
                endEffector23(:,i)=endEffector(:,i);
                E23(i) = 0.5*(norm(P2P3_arch(:,i) - endEffector(:,i))^2);

                pos31 = direct_kinematics(links, [Q3Q1_arch(i,1) Q3Q1_arch(i,2) Q3Q1_arch(i,3)]);
                endEffector(:,i) = pos31(1:3,4);
                endEffector31(:,i)=endEffector(:,i);
                E31(i) = 0.5*(norm(P3P1_arch(:,i) - endEffector(:,i))^2);
            end
            
            figure();
            plot3(P1P2_arch(1,:),P1P2_arch(2,:),P1P2_arch(3,:),'>','Color','black'); hold on;
            plot3(P2P3_arch(1,:),P2P3_arch(2,:),P2P3_arch(3,:),'>','Color','black'); hold on;
            plot3(P3P1_arch(1,:),P3P1_arch(2,:),P3P1_arch(3,:),'>','Color','black'); hold on;
            hold on; 
            for i = 1 : N
                endeff = endEffector12(:,i);
                plot3(endeff(1),endeff(2),endeff(3), "+", 'Color','#e69832');
                hold on;
                endeff = endEffector23(:,i);
                plot3(endeff(1),endeff(2),endeff(3), "+", 'Color','#e69832');
                hold on;
                endeff = endEffector31(:,i);
                plot3(endeff(1),endeff(2),endeff(3), "+", 'Color','#e69832');
                hold on;
            end
            grid on; title("END EFFECTOR CIRCUMFERENCE COVERAGE");
            
            figure();
            plot(t12, E12); hold on;
            plot(t23, E23); hold on;
            plot(t31, E31);
            grid on; xlabel("\sigma"); ylabel("error"); 
            title("CIRCUMFERENCE ERROR");
        end
        
    
    end

end