%%
% forward kinematics qzk
clear;clc;

%joint_space = [0,-pi/2,-pi/2,0,pi,0];
disp('�ؽڿռ䣺')
joint_space = [17.4424,-58.6414,-117.1853,-22.5087,-74.2497,66.8016]/180*pi
disp('���˶�ѧ���ؽڿռ��Ӧ�Ĵ��ݾ���')
T = UR_forward_kinematics(joint_space)
disp('���˶�ѧ�����ݾ����Ӧ�Ĺؽڿռ䣺')
UR_reverse_kinematics(T)
% disp('�ٴ����˶�ѧ���ؽڿռ��Ӧ�Ĵ��ݾ���')
% t1 = UR_forward_kinematics(t)