%traj_p2p test
clear;clc;
joint_space = [25 60 -135 62 -152 86]/180*pi
Ts = UR_forward_kinematics(joint_space)
joint_space = [120,50,-30,10,112,-30]/180*pi
Te = UR_forward_kinematics(joint_space)
THETA = traj_p2p(Ts,Te);  %每一行代表一个theta

cnt = 1;
for i = 1:80:size(THETA,1)
    T = UR_forward_kinematics(THETA(i,:));
    POINTS(cnt,:) = T(1:3,4)';
    cnt = cnt+1;
end

plot3(POINTS(:,1),POINTS(:,2),POINTS(:,3),'*');
hold on
plot3([Ts(1,4),Te(1,4)],[Ts(2,4),Te(2,4)],[Ts(3,4),Te(3,4)]);
