function T03 = CinematicaDiretta(links, thetas)

    l2 = links(2); l3 = links(3);
    
    theta1 = thetas(1); theta2 = thetas(2); theta3 = thetas(3);
    
    T03 = [
            [cos(theta1)*cos(theta2+theta3) -cos(theta1)*sin(theta2+theta3) sin(theta1) cos(theta1)*(l2*cos(theta2)+l3*cos(theta2+theta3))]
            [sin(theta1)*cos(theta2+theta3) -sin(theta1)*sin(theta2+theta3) -cos(theta1) sin(theta1)*(l2*cos(theta2)+l3*cos(theta2+theta3))]
            [sin(theta2+theta3) cos(theta2+theta3) 0 l2*sin(theta2)+l3*sin(theta2+theta3)]
            [0 0 0 1]
          ];
    
end