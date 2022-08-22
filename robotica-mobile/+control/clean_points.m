function[q, qd, qdd] = clean_points(q, qd, qdd)

    size_q = size(q);
    size_qd = size(qd);
    size_qdd = size(qdd);
    
    j=1;
    for i=1: 2: size_q(2)
        qtmp(1,j) = q(1,i);
        qtmp(2,j) = q(2,i);
        j=j+1;
    end
    j=1;
    for i=1: 2: size_qd(2)
        qdtmp(1,j) = qd(1,i);
        qdtmp(2,j) = qd(2,i);
        j=j+1;
    end
    j=1;
    for i=1: 2: size_qdd(2)
        qddtmp(1,j) = qdd(1,i);
        qddtmp(2,j) = qdd(2,i);
        j=j+1;
    end
    
    q = qtmp;
    qd = qdtmp;
    qdd = qddtmp;

end
