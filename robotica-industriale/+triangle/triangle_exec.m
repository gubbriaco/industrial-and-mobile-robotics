function [PP_segment, PP_segment_derived, QQ_segment, QQ_segment_derived] ...
                                     = triangle_exec(T1, T2, T3, T4, Qp1, Qp2, Qp3)
                              
    global P1 P2 P3
                                                        
    import plot.Plot;
    Plot.points();

    
    import path.Path;
    
    % segmento P1->P2
    [P1P2_segment, P1P2_segment_derived, Q1Q2_segment, Q1Q2_segment_derived] ...
                                  = Path.segment(T1,T2, P1, P2, Qp1, Qp2);
    % segmento P2->P3
    [P2P3_segment, P2P3_segment_derived, Q2Q3_segment, Q2Q3_segment_derived] ...
                                  = Path.segment(T2,T3, P2, P3, Qp2, Qp3);
    % segmento P3->P1
    [P3P1_segment, P3P1_segment_derived, Q3Q1_segment, Q3Q1_segment_derived] ...
                                  = Path.segment(T3,T4, P3, P1, Qp3, Qp1);
    grid on; xlabel('X'); ylabel('Y'); zlabel('Z');
    
    
    PP_segment = [P1P2_segment P2P3_segment P3P1_segment];
    PP_segment_derived = [P1P2_segment_derived P2P3_segment_derived P3P1_segment_derived];
    QQ_segment = [Q1Q2_segment Q2Q3_segment Q3Q1_segment];
    QQ_segment_derived = [Q1Q2_segment_derived Q2Q3_segment_derived Q3Q1_segment_derived];
    
end