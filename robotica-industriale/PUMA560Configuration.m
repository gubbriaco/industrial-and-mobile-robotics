classdef PUMA560Configuration

    properties (Access=private)
        link1 {mustBeFinite, mustBeReal}
        link2 {mustBeFinite, mustBeReal}
        link3 {mustBeFinite, mustBeReal}
        
        alpha1 {mustBeReal}
        alpha2 {mustBeReal}
        alpha3 {mustBeReal}
        
        d1 {mustBeFinite, mustBeReal}
        d2 {mustBeFinite, mustBeReal}
        d3 {mustBeFinite, mustBeReal}
        
        theta1 {mustBeReal}
        theta2 {mustBeReal}
        theta3 {mustBeReal}
    end
    
    properties (Access=private)
        R0b(4,4)
    end
    
    properties (Access=private, Constant)
        revolute = 0;
        prismatic = 1;
    end
    
    properties (Access=private)
        LINK1
        LINK2
        LINK3
    end
    
    %% COSTRUTTORE
    methods
        function robot = PUMA560Configuration(links, alphas, ds, thetas)
            robot.link1 = links(1);
            robot.link2 = links(2);
            robot.link3 = links(3);
            
            robot.alpha1 = alphas(1);
            robot.alpha2 = alphas(2);
            robot.alpha3 = alphas(3);
            
            robot.d1 = ds(1);
            robot.d2 = ds(2);
            robot.d3 = ds(3);
            
            robot.theta1 = thetas(1);
            robot.theta2 = thetas(2);
            robot.theta3 = thetas(3);
        end 
    end
    
    %% LEGAME TRA SISTEMA DI RIFERIMENTO (0) E (b)
    methods
    	function robot = SistemaRiferimentoMatriceRotoTraslazione(R0b)
            if length(R0b) ~= 4
                error("Numero di righe della matrice non valido");
            end
            for i=1:4
                if length(R0b(i)) ~= 4
                    error("Numero di colonne della matrice non valido");
                end
            end
            
            robot.R0b = R0b;
        end
    end
    
    %% METODI PER IMPOSTAZIONE TIPOLOGIA GIUNTI
    methods
        
        %% IMPOSTA LA TIPOLOGIA DEL GIUNTO 1
        function LINK1Type(type)
            if type==0
                LINK1 = Link( [theta1, d1, link1, alpha1, revolute], 'standard' );
            end
            if type==1
                LINK1 = Link( [theta1, d1, link1, alpha1, prismatic], 'standard' );
                q1Min=0; q1Max=pi/2;
                LINK1.qlim = [q1Min q1Max];
            end
        end
        
        %% IMPOSTA LA TIPOLOGIA DEL GIUNTO 2
        function LINK2Type(type)
            if type==0
                LINK2 = Link( [theta2, d2, link2, alpha2, revolute], 'standard' );
            end
            if type==1
                LINK2 = Link( [theta2, d2, link2, alpha2, prismatic], 'standard' );
            end
        end
        
        %% IMPOSTA LA TIPOLOGIA DEL GIUNTO 3
        function LINK3Type(type)
            if type==0
                LINK3 = Link( [theta3, d3, link3, alpha3, revolute], 'standard' );
            end
            if type==1
                LINK3 = Link( [theta3, d3, link3, alpha3, prismatic], 'standard' );
            end
        end
          
    end
    
    methods (Static)
          %% PUMA560 PLOT
        function PUMA560plot()
            LINK1 = Link( [theta1, d1, link1, alpha1, PUMA560Configuration.LINK1.sigma], 'standard' );
            LINK2 = Link( [theta2, d2, link2, alpha2, PUMA560Configuration.revolute], 'standard' );
            LINK3 = Link( [theta3, d3, link3, alpha3, PUMA560Configuration.revolute], 'standard' );
            
            LINKS = [LINK1 LINK2 LINK3];
            puma560 = SerialLink(LINKS, 'name', 'PUMA 560');

            figure();
            puma560.plot(theta);
        end
    end

    
end