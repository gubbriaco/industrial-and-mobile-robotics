function c = control_input()

    disp(" "); disp(" ");
    disp("Scegliere la tipologia di controllo a cui applicare la posture regulation:");
    disp("l := linear control");
    disp("n := non linear control");
    disp("io := input-output control");
    disp(" ");
    c = input("Inserire la tipologia di controllo: " , "s");
    c = "" + c;

end