function DYNAMIC_ON = main_input()


    % questa function permette all'utente che esegue il programma di
    % scegliere tramite console se effettuare plot statici o dinamici.

    disp(" "); disp(" ");
    disp("Scegliere se effettuare plot statici o dinamici.");
    disp("I formati di input per la tipologia di plot:");
    disp("s := static plot");
    disp("d := dynamic plot");
    disp(" ");
    DYNAMIC_ON = input("Inserire la tipologia di path planning da simulare: ", "s");
    DYNAMIC_ON = "" + DYNAMIC_ON;
    
    if strcmpi(DYNAMIC_ON, "s")
        DYNAMIC_ON = 0;
    elseif strcmpi(DYNAMIC_ON, "d")
        DYNAMIC_ON = 1;
    else
        error("Input non valido.")
    end
    

end