classdef Error

    methods(Static)
    
        
        function triangle(P1P2_segment, Q1Q2_segment, P2P3_segment, ...
                                  Q2Q3_segment, P3P1_segment, Q3Q1_segment)
            global links sigma t12 t23 t31;
            import cinematica.cinematica_diretta.cinematica_diretta;
            figure();
            N = length(sigma);
            for i = 1 : N
                pos12 = cinematica_diretta(links, ...
                    [Q1Q2_segment(i,1) Q1Q2_segment(i,2) Q1Q2_segment(i,3)]);
                endEffector(:,i) = pos12(1:3,4);
                E12(i) = 0.5*(norm(P1P2_segment(i,:)' - endEffector(:,i))^2);

                pos23 = cinematica_diretta(links, ...
                    [Q2Q3_segment(i,1) Q2Q3_segment(i,2) Q2Q3_segment(i,3)]);
                endEffector(:,i) = pos23(1:3,4);
                E23(i) = 0.5*(norm(P2P3_segment(i,:)' - endEffector(:,i))^2);

                pos31 = cinematica_diretta(links, ...
                    [Q3Q1_segment(i,1) Q3Q1_segment(i,2) Q3Q1_segment(i,3)]);
                endEffector(:,i) = pos31(1:3,4);
                E31(i) = 0.5*(norm(P3P1_segment(i,:)' - endEffector(:,i))^2);
            end
            plot(t12,E12); hold on;
            plot(t23,E23); hold on;
            plot(t31,E31);
            grid; xlabel("\sigma"); ylabel("Errore"); title("Errore Triangolo");
        end
        
        
        function circumference(P1P2_arch, Q1Q2_arch, P2P3_arch, ...
                                           Q2Q3_arch, P3P1_arch, Q3Q1_arch)
            global links sigma t12 t23 t31;
            import cinematica.cinematica_diretta.cinematica_diretta;
            figure();
            for i=1:length(sigma)
                pos12 = cinematica_diretta(links, ...
                            [Q1Q2_arch(i,1) Q1Q2_arch(i,2) Q1Q2_arch(i,3)]);
                endEffector(i,:) = pos12(1:3,4);
                E12(i) = 0.5*(norm(P1P2_arch(i,:) - endEffector(i,:))^2);

                pos23 = cinematica_diretta(links, ...
                            [Q2Q3_arch(i,1) Q2Q3_arch(i,2) Q2Q3_arch(i,3)]);
                endEffector(i,:) = pos23(1:3,4);
                E23(i) = 0.5*(norm(P2P3_arch(i,:) - endEffector(i,:))^2);

                pos31 = cinematica_diretta(links, ...
                            [Q3Q1_arch(i,1) Q3Q1_arch(i,2) Q3Q1_arch(i,3)]);
                endEffector(i,:) = pos31(1:3,4);
                E31(i) = 0.5*(norm(P3P1_arch(i,:) - endEffector(i,:))^2);
            end
            plot(t12,E12); hold on;
            plot(t23,E23); hold on;
            plot(t31,E31);
            grid; xlabel("\sigma"); ylabel("Errore"); title("Errore Circonferenza");
        end
        
    
    end

end