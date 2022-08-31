function [Qp1, Qp2, Qp3, T01, T12, T23] = cinematica_exec()

    import cinematica.cinematica_inversa.cinematica_inversa_exec;
    Qp = cinematica_inversa_exec();
    Qp1 = Qp(:,1); 
    Qp2 = Qp(:,2);
    Qp3 = Qp(:,3);
    
    import cinematica.cinematica_diretta.cinematica_diretta_exec;
    T = cinematica_diretta_exec(Qp1, Qp2, Qp3);
    T01 = T(1);
    T12 = T(2);
    T23 = T(3);
    
end