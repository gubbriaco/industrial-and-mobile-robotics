function p = posture_input()

    % questa function permette all'utente che esegue il programma di 
    % scegliere quale tipologia di posture regulation considerare per il
    % plot dinamico che verrà eseguito.

    disp(" "); disp(" ");
    disp("Scegliere la tipologia di posture da visualizzare in maniera dinamica:");
    disp("ca := cartesian regulation");
    disp("co := complete regulation");
    disp(" ");
    p = input("Inserire la tipologia di posture regulation: " , "s");
    p = "" + p;

end