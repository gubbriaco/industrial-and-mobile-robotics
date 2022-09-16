function DYNAMIC_ON = control_input()

    % questa function permette all'utente che esegue il programma di
    % scegliere tramite console se effettuare plot statici o dinamici delle
    % traiettorie generate dopo aver applicato i vari algoritmi di
    % controllo.

    disp(" "); disp(" ");
    disp("Scegliere se effettuare plot statici o dinamici.");
    disp("I formati di input per la tipologia di plot:");
    disp("s := static plot");
    disp("d := dynamic plot");
    disp(" ");
    DYNAMIC_ON = input("Inserire la tipologia di path planning da simulare: ", "s");
    DYNAMIC_ON = "" + DYNAMIC_ON;

end