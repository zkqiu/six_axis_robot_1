%%
clear;clc;

% !!! theta5 = 0 / pi 发生奇异

% disp('关节空间：')
% joint_space = [0,pi/2,-pi/2,0,pi/2,0]
%joint_space = [pi/2,0,-pi/4,pi/4,-pi/2,0];%此处存在很多奇异的地方
%joint_space = [120,70,-20,10,112,-30]/180*pi
%joint_space = [120,-70,-30,10,112,-30]/180*pi
%joint_space = [120,50,-30,10,112,-30]/180*pi
%joint_space = [25 60 -135 62 -152 86]/180*pi;

% disp('正运动学：关节空间对应的传递矩阵：')
% T = UR_forward_kinematics(joint_space)

disp('逆运动学：传递矩阵对应的关节空间：')
Ts = [eye(3) [25 25 25]';0 0 0 1]
Te = [eye(3) [50 50 50]';0 0 0 1]
theta_start = UR_reverse_kinematics(Ts)
theta_end = UR_reverse_kinematics(Te)

disp('再次正运动学：关节空间对应的传递矩阵：')
i=1;
ts = UR_forward_kinematics(theta_start(i,:))
te = UR_forward_kinematics(theta_end(i,:))
%t2 = UR_forward_kinematics(theta(7,:))
