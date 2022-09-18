function PLOT_WITH_TIME = plot_time_input()

    % questa function permette all'utente che esegue il programma di
    % scegliere tramite console se effettuare i plot dinamici del
    % manipolatore che descrive il percorso del triangolo e della
    % circonferenza rispettivamente in 40 secondi ognuno.

    disp(" "); disp(" ");
    disp("Scegliere se effettuare i plot dinamici del manipolatore in 40 secondi.");
    disp("y := effettua i plot dinamici in 40 secondi");
    disp("n := non effettuare i plot dinamici in 40 secondi");
    disp(" ");
    PLOT_WITH_TIME = input("Inserire la scelta effettuata: ", "s");
    PLOT_WITH_TIME = "" + PLOT_WITH_TIME;
    
    if strcmpi(PLOT_WITH_TIME, "y")
        PLOT_WITH_TIME = 1;
    elseif strcmpi(PLOT_WITH_TIME, "n")
        PLOT_WITH_TIME = 0;
    else
        error("Input non valido.")
    end
    

end