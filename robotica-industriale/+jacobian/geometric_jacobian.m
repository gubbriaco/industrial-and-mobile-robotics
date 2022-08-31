function JP = geometric_jacobian(links, angles)

    l1 = links(1); l2 = links(2); l3 = links(3); 
    q1 = angles(1); q2 = angles(2); q3 = angles(3);
    
    c1 = cos(q1);
    c2 = cos(q2);
    c23 = cos(q2+q3);
    s1 = sin(q1);
    s2 = sin(q2);
    s23 = sin(q2+q3);
    
    J = [
            -s1*(l2*c2+l3*c23) -c1*(l2*s2+l3*s23) -l3*c1*s23;
            c1*(l2*c2+l3*c23) -s1*(l2*s2+l3*s23) -l3*s1*s23;
            0 l2*c2+l3*c23 l3*c23;
            0 s1 s1
            0 -c1 -c1
            1 0 0
        ];
    
%     Nello Jacobiano J solo tre righe sono linearmente indipendenti. Avendo 
%     a disposizione solo 3 gradi di liberta', e' opportuno considerare solo
%     il blocco superiore (3x3) dello Jacobiano:
    
    JP = [
            -s1*(l2*c2+l3*c23) -c1*(l2*s2+l3*s23) -l3*c1*s23;
            c1*(l2*c2+l3*c23) -s1*(l2*s2+l3*s23) -l3*s1*s23;
            0 l2*c2+l3*c23 l3*c23;
        ]; 
    
%     esso descrive la relazione tra velocita' ai giunti e velocita' lineare 
%     dell'organo terminale.

end