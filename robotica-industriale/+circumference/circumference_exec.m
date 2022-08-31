function [PP_arch, PP_arch_derived, QQ_arch, QQ_arch_derived] = circumference_exec()

    global radius_circumference

    import plot.Plot;
    Plot.points();

    % theta1 = pi+0.6435; theta2 = theta1+1.8546;
    % theta3 = theta2; theta4 = theta3+pi/2+0.6435;
    % theta5 = pi/2; theta6 = theta5+pi/2+0.6435;

    
    import path.Path;
    
    h=0.15; angle=asin(h/radius_circumference);
    % arco P1->P2
    theta1 = angle+pi; 
    diff = (3*(pi/2))-theta1; 
    theta2 = (2*diff)+theta1;
    [P1P2_arch, P1P2_arch_derived, Q1Q2_arch, Q1Q2_arch_derived] ...
                                                = Path.arch(theta1,theta2);
    % arco P2->P3
    theta3 = theta2;
    theta4 = theta3+(pi/2)+angle;
    [P2P3_arch, P2P3_arch_derived, Q2Q3_arch, Q2Q3_arch_derived] ...
                                               = Path.arch(theta3, theta4);
    % arco P3->P1
    theta5 = theta4;
    theta6 = theta5+(pi/2)+angle;
    [P3P1_arch, P3P1_arch_derived, Q3Q1_arch, Q3Q1_arch_derived] ...
                                               = Path.arch(theta5, theta6);
    grid on; xlabel('X'); ylabel('Y'); zlabel('Z');
    
    
    PP_arch = [P1P2_arch P2P3_arch P3P1_arch];
    
    PP_arch_derived = [P1P2_arch_derived' P2P3_arch_derived' P3P1_arch_derived'];
    
    QQ_arch = [Q1Q2_arch Q2Q3_arch Q3Q1_arch];
   
    QQ_arch_derived = [Q1Q2_arch_derived' Q2Q3_arch_derived' Q3Q1_arch_derived'];

end