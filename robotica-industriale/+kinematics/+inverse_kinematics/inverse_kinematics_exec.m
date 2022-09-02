function Qp = inverse_kinematics_exec()


    global links P1 P2 P3
    
    import kinematics.inverse_kinematics.inverse_kinematics;
    Qp1 = inverse_kinematics(links, P1);
    Qp2 = inverse_kinematics(links, P2);
    Qp3 = inverse_kinematics(links, P3);
    
    Qp = [Qp1 Qp2 Qp3];
    
end