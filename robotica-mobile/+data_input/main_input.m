function type = main_input()

    % questa function permette all'utente che esegue il programma di 
    % scegliere tramite console quale path planning considerare per la 
    % generazione della traiettoria che il roboto mobile dovrà seguire per 
    % raggiungere la posizione targer a partire da una posizione di start 
    % iniziale.

    disp("PER TERMINARE IL PROGRAMMA CLICCARE CTRL + C SULLA TASTIERA.");
    disp(" ");
    disp("Scegliere una tra le tipologie elencate. Gli input sono non case sensitive.");
    disp("I formati di input per la tipologia di path planning sono:");
    disp("a := Artificial Potential Fields");
    disp("d := Discrete Potential Fields");
    disp("vo := Voronoi Diagrams");
    disp("vi := Visibility Graphs");
    disp(" ");
    type = input("Inserire la tipologia di path planning da simulare: ", "s");
    type = "" + type;

end