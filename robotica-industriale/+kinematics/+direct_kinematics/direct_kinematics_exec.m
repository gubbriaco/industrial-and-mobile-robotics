function [T01, T12, T23] = direct_kinematics_exec(Qp)


    global links
    
    Qp1 = Qp(:,1);
    Qp2 = Qp(:,2);
    Qp3 = Qp(:,3);

    import kinematics.direct_kinematics.direct_kinematics;
    T01 = direct_kinematics(links, Qp1);
    T12 = direct_kinematics(links, Qp2);
    T23 = direct_kinematics(links, Qp3);
    
end