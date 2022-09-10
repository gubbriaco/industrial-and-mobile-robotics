function circumference_exec(DYNAMIC_ON)

    % theta1 = pi+0.6435; theta2 = theta1+1.8546;
    % theta3 = theta2; theta4 = theta3+pi/2+0.6435;
    % theta5 = pi/2; theta6 = theta5+pi/2+0.6435;

    
    global circumference_radius
    h=0.15; angle=asin(h/circumference_radius);


    global P1P2_arch P2P3_arch P3P1_arch
    global P1P2_derived_arch P2P3_derived_arch P3P1_derived_arch
    global Q1Q2_arch Q2Q3_arch Q3Q1_arch
    global Q1Q2_derived_arch Q2Q3_derived_arch Q3Q1_derived_arch

    import path.Path;
    %% P1->P2 arch
    theta1=angle+pi; diff = (3*(pi/2))-theta1; theta2 = (2*diff)+theta1;
    [P1P2_arch, P1P2_derived_arch, Q1Q2_arch, Q1Q2_derived_arch] = ...
                                      Path.arch(theta1,theta2, DYNAMIC_ON);
    
    %% P2->P3 arch
    theta3=theta2; theta4=theta3+(pi/2)+angle;
    [P2P3_arch, P2P3_derived_arch, Q2Q3_arch, Q2Q3_derived_arch] = ...
                                      Path.arch(theta3,theta4, DYNAMIC_ON);
    
    %% P3->P1 arch
    theta5=theta4; theta6=theta5+(pi/2)+angle;
    [P3P1_arch, P3P1_derived_arch, Q3Q1_arch, Q3Q1_derived_arch] = ...
                                      Path.arch(theta5,theta6, DYNAMIC_ON);
    
    grid on; xlabel('X'); ylabel('Y'); zlabel('Z');



end