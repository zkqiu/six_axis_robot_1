%%
clear;clc;

disp('�ؽڿռ䣺')
%joint_space = [0,-pi/2,-pi/2,0,pi,0];
%joint_space = [120,70,-20,10,112,-30]/180*pi
%joint_space = [120,-70,-30,10,112,-30]/180*pi
%joint_space = [120,50,-30,10,112,-30]/180*pi
joint_space = [25 60 -135 62 -152 86]/180*pi;
disp('���˶�ѧ���ؽڿռ��Ӧ�Ĵ��ݾ���')
T = UR_forward_kinematics(joint_space)
disp('���˶�ѧ�����ݾ����Ӧ�Ĺؽڿռ䣺')
% T = [eye(3) [25 25 25]';0 0 0 1]
theta = UR_reverse_kinematics(T)
% disp('�ٴ����˶�ѧ���ؽڿռ��Ӧ�Ĵ��ݾ���')
% i=7;
% theta(i,:)
% t1 = UR_forward_kinematics(theta(i,:))

%t2 = UR_forward_kinematics(theta(7,:))