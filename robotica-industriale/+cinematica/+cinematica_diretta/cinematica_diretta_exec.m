function T = cinematica_diretta_exec(Qp1, Qp2, Qp3)
    
    global links
    import cinematica.cinematica_diretta.cinematica_diretta;
    
    T01 = cinematica_diretta(links, Qp1);
    T12 = cinematica_diretta(links, Qp2);
    T23 = cinematica_diretta(links, Qp3);
    
    T = [T01 T12 T23];
    
end