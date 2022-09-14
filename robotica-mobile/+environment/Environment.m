classdef Environment
   
   properties
        width {mustBeFinite, mustBeNonnegative}
        height {mustBeFinite, mustBeNonnegative}
        nc {mustBeFinite, mustBeNonnegative}
        nr {mustBeFinite, mustBeNonnegative}
   end
   
   methods
       function environment=Environment(width, height, nc, nr)
            environment.width=width;
            environment.height=height;
            environment.nc=nc;
            environment.nr=nr;
       end
       
       function inizialize(environment)
            % e' una function che permette di inizializzare l'environment
            global grid X Y gridni Xni Yni
            % Genero una mappa di ostacoli che sistemo in una griglia 
            % binaria di occupazione dello spazio. Di conseguenza per 
            % rappresentare gli ostacoli posso sfruttare una meshgrid. 

            %% GRID ENVIRONMENT
            %nr = 100; nc = 100;
            x_origin=1; y_origin=1;
            %width=100; height=100;
            
            % la griglia generata sara' la griglia utilizzata per gli
            % ostacoli ingrassati
            grid = zeros(environment.nr, environment.nc);
            % y = linspace(x1,x2,n) genera n punti. La distanza tra i punti
            % è (x2-x1)/(n-1). 
            % linspace è simile all'operatore due punti, “:”, ma da' il 
            % controllo diretto sul numero di punti e include sempre i 
            % punti finali. "lin" nel nome "linspace" si riferisce alla 
            % generazione di valori distanziati linearmente rispetto alla 
            % funzione di pari livello logspace, che genera valori 
            % distanziati logaritmicamente.
            width_points = linspace(x_origin-1, environment.nr,...
                                                        environment.width);
            height_points = linspace(y_origin-1, environment.nc,...
                                                       environment.height);
            % [X,Y] = meshgrid(x,y) restituisce le coordinate della griglia
            % 2D in base alle coordinate contenute nei vettori x e y. X è 
            % una matrice in cui ogni riga è una copia di x e Y è una 
            % matrice in cui ogni colonna è una copia di y. La griglia 
            % rappresentata dalle coordinate X e Y ha righe lunghezza(y) e 
            % colonne lunghezza(x).
            [X,Y] = meshgrid(width_points, height_points);
            
            % faccio lo stesso procedimento ma in questo caso genero la
            % griglia che mi servira' per posizionare gli ostacoli non
            % ingrassati
            gridni = zeros(environment.nr, environment.nc);
            width_points = linspace(x_origin-1, environment.nr, environment.width);
            height_points = linspace(y_origin-1, environment.nc, environment.height);
            [Xni,Yni] = meshgrid(width_points, height_points);
       end
       
       function add_obstacles(environment, ob_value)
            % e' una function che permette l'aggiunta degli ostacoli
            % nell'environment impostando l'altezza dell'ostacolo al valore
            % di ob_value
            global radius_robot 
            global grid nr_obstacles obstacles X Y
            global gridni nr_obstaclesni obstaclesni Xni Yni

            % nr_obstaclesni e obstaclesni sono rispettivamente il numero
            % degli ostacoli non ingrossati e il vettore che contiene le
            % coordinate e le grandezze degli ostacoli non ingrossati
            %% OBSTACLES
            nr_obstacles=0;
            nr_obstaclesni=0;

            
            %% WALLS
            % definisco i 4 muri che delimitano l'environment
            
            % under wall
            grid(1:2,1:100) = ob_value;
            nr_obstacles = nr_obstacles+1;
            obstacles(nr_obstacles,:) = [X(1,1) X(1,100) Y(1) Y(2)];

            % over wall
            grid(99:100,1:100) = ob_value; 
            nr_obstacles = nr_obstacles+1;
            obstacles(nr_obstacles,:) = [X(1,1) X(1,100) Y(99) Y(100)];

            % left wall
            grid(1:100,1:2) = ob_value; 
            nr_obstacles = nr_obstacles+1;
            obstacles(nr_obstacles,:) = [X(1,1) X(1,2) Y(1) Y(100)];

            % right wall
            grid(1:100,99:100) = ob_value; 
            nr_obstacles = nr_obstacles+1;
            obstacles(nr_obstacles,:) = [X(1,99) X(1,100) Y(1) Y(100)];


            %% OBSTACLES
            
            % obstacle nr.1
            % definisco l'ostacolo ingrassato
            x_left=30; x_right=40; 
            y_under=10; y_over=20;
            grid(x_left:x_right,y_under:y_over) = ob_value;   
            nr_obstacles = nr_obstacles+1;
            obstacles(nr_obstacles,:) = [X(1,y_under) X(1,y_over) Y(x_left) Y(x_right)];
            % definisco l'ostacolo non ingrassato
            x_left=x_left+radius_robot; x_right=x_right-radius_robot;
            y_under=y_under+radius_robot; y_over=y_over-radius_robot;
            gridni(x_left:x_right,y_under:y_over) = ob_value;
            nr_obstaclesni = nr_obstaclesni+1; 
            obstaclesni(nr_obstaclesni,:) = [Xni(1,y_under) Xni(1,y_over) Yni(x_left) Yni(x_right)];
            
            % obstacle nr.2
            % definisco l'ostacolo ingrassato
            x_left=40; x_right=45;
            y_under=40; y_over=70;
            grid(x_left:x_right,y_under:y_over) = ob_value;   
            nr_obstacles = nr_obstacles+1;
            obstacles(nr_obstacles,:) = [X(1,y_under) X(1,y_over) Y(x_left) Y(x_right)];
            % definisco l'ostacolo non ingrassato
            x_left=x_left+radius_robot; x_right=x_right-radius_robot;
            y_under=y_under+radius_robot; y_over=y_over-radius_robot;
            gridni(x_left:x_right,y_under:y_over) = ob_value;
            nr_obstaclesni = nr_obstaclesni+1; 
            obstaclesni(nr_obstaclesni,:) = [Xni(1,y_under) Xni(1,y_over) Yni(x_left) Yni(x_right)];
            
            % obstacle nr.3
            % definisco l'ostacolo ingrassato
            x_left=15; x_right=35; 
            y_under=35; y_over=60;
            grid(x_left:x_right,y_under:y_over) = ob_value;
            nr_obstacles = nr_obstacles+1;
            obstacles(nr_obstacles,:) = [X(1,y_under) X(1,y_over) Y(x_left) Y(x_right)];
            % definisco l'ostacolo non ingrassato
            x_left=x_left+radius_robot; x_right=x_right-radius_robot;
            y_under=y_under+radius_robot; y_over=y_over-radius_robot;
            gridni(x_left:x_right,y_under:y_over) = ob_value;
            nr_obstaclesni = nr_obstaclesni+1; 
            obstaclesni(nr_obstaclesni,:) = [Xni(1,y_under) Xni(1,y_over) Yni(x_left) Yni(x_right)];

            % obstacle nr.4
            % definisco l'ostacolo ingrassato
            x_left=70; x_right=90; 
            y_under=15; y_over=60;
            grid(x_left:x_right,15:60) = ob_value;      
            nr_obstacles = nr_obstacles+1;
            obstacles(nr_obstacles,:) = [X(1,y_under) X(1,y_over) Y(x_left) Y(x_right)];
            % definisco l'ostacolo non ingrassato
            x_left=x_left+radius_robot; x_right=x_right-radius_robot;
            y_under=y_under+radius_robot; y_over=y_over-radius_robot;
            gridni(x_left:x_right,y_under:y_over) = ob_value;
            nr_obstaclesni = nr_obstaclesni+1; 
            obstaclesni(nr_obstaclesni,:) = [Xni(1,y_under) Xni(1,y_over) Yni(x_left) Yni(x_right)];

            % obstacle nr.5
            % definisco l'ostacolo ingrassato
            x_left=15; x_right=60;
            y_under=80; y_over=90;
            grid(x_left:x_right,y_under:y_over) = ob_value;   
            nr_obstacles = nr_obstacles+1;
            obstacles(nr_obstacles,:) = [X(1,y_under) X(1,y_over) Y(x_left) Y(x_right)];
            % definisco l'ostacolo non ingrassato
            x_left=x_left+radius_robot; x_right=x_right-radius_robot;
            y_under=y_under+radius_robot; y_over=y_over-radius_robot;
            gridni(x_left:x_right,y_under:y_over) = ob_value;
            nr_obstaclesni = nr_obstaclesni+1; 
            obstaclesni(nr_obstaclesni,:) = [Xni(1,y_under) Xni(1,y_over) Yni(x_left) Yni(x_right)];

            % obstacle nr.6
            % definisco l'ostacolo ingrassato
            x_left=70; x_right=75;
            y_under=70; y_over=75;
            grid(x_left:x_right,y_under:y_over) = ob_value;
            nr_obstacles = nr_obstacles+1;
            obstacles(nr_obstacles,:) = [X(1,y_under) X(1,y_over) Y(x_left) Y(x_right)];
            % definisco l'ostacolo non ingrassato
            x_left=x_left+radius_robot; x_right=x_right-radius_robot;
            y_under=y_under+radius_robot; y_over=y_over-radius_robot;
            gridni(x_left:x_right,y_under:y_over) = ob_value;
            nr_obstaclesni = nr_obstaclesni+1; 
            obstaclesni(nr_obstaclesni,:) = [Xni(1,y_under) Xni(1,y_over) Yni(x_left) Yni(x_right)];          
       end
       
       function plot3D(environment)
            % e' una function che permette il plot 3D dell'environment
            global X Y grid 
            Z = 1.*grid;
            mesh(X,Y,Z); xlabel("X"); ylabel("Y"); zlabel("Z");
            title("ENVIRONMENT"),axis("equal"), axis([0 environment.width 0 environment.height])
       end
       
       function plot2D(environment)
           % e' una function che permette il plot 2D dell'environment
           global start goal obstacles obstaclesni radius_robot width height
           hold on; plot(start(1),start(2), "*", "Color","b", "DisplayName","start");
           hold on; plot(goal(1),goal(2), "*", "Color","g", "DisplayName","goal");
           hold on;
           
           % plot walls
           % under wall
           ob = obstacles(1,:);
           x_ob=ob(1); y_ob=ob(3); w_ob=ob(2)-ob(1); h_ob=ob(4)-ob(3);
           rectangle("position",[x_ob y_ob w_ob h_ob], "facecolor","red");
           x_obi=x_ob+radius_robot; y_obi=y_ob+radius_robot; 
           w_obi=w_ob-(2*radius_robot); h_obi=h_ob;
           rectangle("position",[x_obi y_obi w_obi h_obi], "facecolor","#f5c0ba");
           % over wall
           ob = obstacles(2,:);
           x_ob=ob(1); y_ob=ob(3); w_ob=ob(2)-ob(1); h_ob=ob(4)-ob(3);
           rectangle("position",[x_ob y_ob w_ob h_ob], "facecolor","red");
           x_obi=x_ob+radius_robot; y_obi=y_ob-radius_robot; 
           w_obi=w_ob-(2*radius_robot); h_obi=h_ob;
           rectangle("position",[x_obi y_obi w_obi h_obi], "facecolor","#f5c0ba");
           % left wall
           ob = obstacles(3,:);
           x_ob=ob(1); y_ob=ob(3); w_ob=ob(2)-ob(1); h_ob=ob(4)-ob(3);
           rectangle("position",[x_ob y_ob w_ob h_ob], "facecolor","red");
           x_obi=x_ob+radius_robot; y_obi=y_ob+radius_robot; 
           w_obi=w_ob; h_obi=h_ob-(2*radius_robot);
           rectangle("position",[x_obi y_obi w_obi h_obi], "facecolor","#f5c0ba");
           % right wall
           ob = obstacles(4,:);
           x_ob=ob(1); y_ob=ob(3); w_ob=ob(2)-ob(1); h_ob=ob(4)-ob(3);
           rectangle("position",[x_ob y_ob w_ob h_ob], "facecolor","red");
           x_obi=x_ob-radius_robot; y_obi=y_ob+radius_robot; 
           w_obi=w_ob; h_obi=h_ob-(2*radius_robot);
           rectangle("position",[x_obi y_obi w_obi h_obi], "facecolor","#f5c0ba");
           
           nr_walls=4;
           % plot ostacoli ingrassati
           for j = (nr_walls+1) : size(obstacles)
               ob = obstacles(j,:);
               x_ob = ob(1);
               y_ob = ob(3);
               w_ob = ob(2)-ob(1);
               h_ob = ob(4)-ob(3);
               rectangle("position",[x_ob y_ob w_ob h_ob], "facecolor","#f5c0ba");
           end
           % plot ostacoli non ingrassati
           for k = 1 : size(obstaclesni)
               obni = obstaclesni(k,:);
               x_obni = obni(1);
               y_obni = obni(3);
               w_obni = obni(2)-obni(1);
               h_obni = obni(4)-obni(3);
               rectangle("position",[x_obni y_obni w_obni h_obni], "facecolor","red");
           end
       end
       
   end
   
    
end

