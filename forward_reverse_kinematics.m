%%
% forward kinematics
clear;clc;

%joint_space = [0,-pi/2,-pi/2,0,pi,0];
disp('关节空间：')
%joint_space = [120,70,-20,10,112,-30]/180*pi
joint_space = [120,-70,-30,10,112,-30]/180*pi
%joint_space = [120,50,-30,10,112,-30]/180*pi
disp('正运动学：关节空间对应的传递矩阵：')
T = UR_forward_kinematics(joint_space)
disp('逆运动学：传递矩阵对应的关节空间：')
theta = UR_reverse_kinematics(T)
disp('再次正运动学：关节空间对应的传递矩阵：')
i=7;
theta(i,:)
t1 = UR_forward_kinematics(theta(i,:))

%t2 = UR_forward_kinematics(theta(7,:))