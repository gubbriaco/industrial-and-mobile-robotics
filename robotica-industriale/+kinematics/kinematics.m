function kinematics()

    
    %% CINEMATICA INVERSA
    import kinematics.inverse_kinematics.inverse_kinematics_exec;
    global Qp
    Qp = inverse_kinematics_exec();
    

    %% CINEMATICA DIRETTA
    import kinematics.direct_kinematics.direct_kinematics_exec;
    direct_kinematics_exec();
 

end