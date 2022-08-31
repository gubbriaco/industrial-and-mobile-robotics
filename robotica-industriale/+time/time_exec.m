function [T1, T2, T3, T4, t12, t23, t31] = time_exec(total_time)

    global lambda
    
    T1 = 0;
    T2 = T1+(total_time/3);
    T3 = T2+(total_time/3);
    T4 = T3+(total_time/3);

    %definisco il tempo
    t12 = T1 + lambda*(T2-T1);
    t23 = T2 + lambda*(T3-T2);
    t31 = T3 + lambda*(T4-T3);
    
end