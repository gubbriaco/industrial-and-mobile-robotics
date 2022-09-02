function JP = geometric_jacobian(links, angles)

    L1 = links(1); L2 = links(2); L3 = links(3); 
    Q1 = angles(1); Q2 = angles(2); Q3 = angles(3);
    
    c1 = cos(Q1);
    c2 = cos(Q2);
    c23 = cos(Q2+Q3);
    s1 = sin(Q1);
    s2 = sin(Q2);
    s23 = sin(Q2+Q3);
    
    J = [
            -s1*(L2*c2+L3*c23) -c1*(L2*s2+L3*s23) -L3*c1*s23;
            c1*(L2*c2+L3*c23) -s1*(L2*s2+L3*s23) -L3*s1*s23;
            0 L2*c2+L3*c23 L3*c23;
            0 s1 s1
            0 -c1 -c1
            1 0 0
        ];
    
%     Nello Jacobiano J solo tre righe sono linearmente indipendenti. Avendo 
%     a disposizione solo 3 gradi di liberta', e' opportuno considerare solo
%     il blocco superiore (3x3) dello Jacobiano:
    
    JP = [
            -s1*(L2*c2+L3*c23) -c1*(L2*s2+L3*s23) -L3*c1*s23;
            c1*(L2*c2+L3*c23) -s1*(L2*s2+L3*s23) -L3*s1*s23;
            0 L2*c2+L3*c23 L3*c23;
        ]; 
    
%     esso descrive la relazione tra velocita' ai giunti e velocita' lineare 
%     dell'organo terminale.

end