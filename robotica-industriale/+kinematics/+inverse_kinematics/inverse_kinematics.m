function Q = inverse_kinematics(links, POINT)

    L2=links(2); L3=links(3);

    px=POINT(1); py=POINT(2); pz=POINT(3);
    d = norm(POINT);

    if d <= (L2+L3)
        Q1 = atan2( py, px );
        c3 = ( (px)^2 + py^2 + (pz)^2 - L2^2 - L3^2) / (2 * L2 * L3);
        s3 = sqrt(1 - c3^2);
        Q3 = atan2( s3, c3 );
        
        A = [
            L2+L3*c3 L3*s3;
            -L3*s3 L2+L3*c3
            ];
        
        B = inv(A) * [
                        pz; 
                        sqrt(px^2+py^2)
                      ];
                  
        Q2 = atan2( B(1), B(2) );
        
        Q = [Q1 ; Q2 ; Q3];
        
    else
        error("Punto fuori dallo spazio di lavoro");
       % Q=[0;0;0];
        
    end


end