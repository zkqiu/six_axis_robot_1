function rtb_animation_jacobian( Ts,Te )
%RTB_ANIMATION 点到点动画
%   rtb_animation( Ts,Te )
%   Ts Te 分别为起点的终点的位姿矩阵

%DH-table
load DH_table

L1 = Link('d', d1, 'a', a1, 'alpha', alpha1);
L2 = Link('d', d2, 'a', a2, 'alpha', alpha2);
L3 = Link('d', d3, 'a', a3, 'alpha', alpha3);
L4 = Link('d', d4, 'a', a4, 'alpha', alpha4);
L5 = Link('d', d5, 'a', a5, 'alpha', alpha5);
L6 = Link('d', d6, 'a', a6, 'alpha', alpha6);
robot = SerialLink([L1 L2 L3 L4 L5 L6], 'name', 'my robot');

THETA = traj_p2p_jacobian(Ts,Te)
for i = 1:size(THETA,1)
    robot.plot(THETA(i,:))
    pause(0.04);
end

end
