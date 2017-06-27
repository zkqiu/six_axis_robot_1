%%
% forward kinematics
clear;clc;

%joint_space = [0,-pi/2,-pi/2,0,pi,0];
disp('关节空间：')
joint_space = [17.4424,-58.6414,-117.1853,-22.5087,-74.2497,66.8016]/180*pi
disp('正运动学：关节空间对应的传递矩阵：')
T = UR_forward_kinematics(joint_space)
disp('逆运动学：传递矩阵对应的关节空间：')
t = UR_reverse_kinematics(T)
disp('再次正运动学：关节空间对应的传递矩阵：')
t1 = UR_forward_kinematics(t)