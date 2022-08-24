function [xstar, ystar, xdstar, ydstar, xddstar, yddstar, thetastar]...
    = trajectory_generation(P, samples)


    Px = P(:,1)';
    Py = P(:,2)';
    wpts = [Px ; Py];
    
    [q, qd, qdd, tvec, pp] = trapveltraj(wpts, samples);
    
%     f=figure(); f.Position=[25 342 1500 420];
%     subplot(1,2,1); plot(tvec, qd(1,:));
%     subplot(1,2,2); plot(tvec, qd(2,:));
%     f=figure(); f.Position=[25 342 1500 420];
%     subplot(1,2,1); plot(tvec, qdd(1,:));
%     subplot(1,2,2); plot(tvec, qdd(2,:));

    xstar = q(1,:);
    ystar = q(2,:);

    xdstar = qd(1,:);
    ydstar = qd(2,:);

    xddstar = qdd(1,:);
    yddstar = qdd(2,:);

    thetastar = atan2(ydstar, xdstar);
    

%     figure();
%     global start goal
%     hold on; plot(start(1),start(2), "*", "Color","b");
%     hold on; plot(goal(1),goal(2), "*", "Color","g");
%     hold on; plot(xstar, ystar);
%     hold on;
%     global obstacles
%     for j = 1 : size(obstacles)
%         ob = obstacles(j,:);
%         x_ob = ob(1);
%         y_ob = ob(3);
%         w_ob = ob(2)-ob(1);
%         h_ob = ob(4)-ob(3);
%         rectangle("position",[x_ob y_ob w_ob h_ob], "facecolor","r");
%     end
%     legend({"start", "goal", "trajectory generated"}, "Location","northwest");
%     title("APPROXIMATED TRAJECTORY");
%     
% 
%     figure();
%     hold on; plot(start(1),start(2), "*", "Color","b");
%     hold on; plot(goal(1),goal(2), "*", "Color","g");
%     hold on; plot(Px, Py);
%     hold on; plot(xstar, ystar);
%     hold on;
%     for j = 1 : size(obstacles)
%         ob = obstacles(j,:);
%         x_ob = ob(1);
%         y_ob = ob(3);
%         w_ob = ob(2)-ob(1);
%         h_ob = ob(4)-ob(3);
%         rectangle("position",[x_ob y_ob w_ob h_ob], "facecolor","r");
%     end
%     legend({"start", "goal", "original trajectory", "trajectory generated", "original trajectory"},...
%            "Location","northwest");
%     title("APPROXIMATED TRAJECTORY AND ORIGINAL TRAJECTORY");                                                 
    
    
end