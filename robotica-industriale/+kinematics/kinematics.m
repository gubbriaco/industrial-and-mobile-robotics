function [Qp, T01, T12, T23] = kinematics()


    %% CINEMATICA INVERSA
    import kinematics.inverse_kinematics.inverse_kinematics_exec;
    Qp = inverse_kinematics_exec();
    

    %% CINEMATICA DIRETTA
    import kinematics.direct_kinematics.direct_kinematics_exec;
    [T01, T12, T23] = direct_kinematics_exec(Qp);
 

end