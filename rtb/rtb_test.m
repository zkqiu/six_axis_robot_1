clear;clc

Ts = [eye(3) [20 20 50]';0 0 0 1];
Te = [eye(3) [60 60 50]';0 0 0 1];
rtb_animation(Ts,Te)
%rtb_animation_jacobian(Ts,Te)
%rtb_plot(Ts)
%theta = UR_reverse_kinematics(Ts)
% for i = 1:8
%     norm(theta(i,:))
% end
% aim_theta = get_best_theta(theta,[0 0 0 0 0 0])