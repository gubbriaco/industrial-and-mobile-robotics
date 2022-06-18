function J = Jacobiano(links, angles)

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
           
        ];

end