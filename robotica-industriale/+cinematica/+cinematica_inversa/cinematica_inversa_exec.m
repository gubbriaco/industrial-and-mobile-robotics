function Qp = cinematica_inversa_exec()
    
    global links P1 P2 P3
    
    
    import cinematica.cinematica_inversa.cinematica_inversa;
    
    Qp1 = cinematica_inversa(links, P1);
    Qp2 = cinematica_inversa(links, P2);
    Qp3 = cinematica_inversa(links, P3);
    
    Qp = [Qp1 Qp2 Qp3];
    
end