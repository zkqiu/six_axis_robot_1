%%
clear;clc;

% !!! theta5 = 0 / pi ��������

% disp('�ؽڿռ䣺')
% joint_space = [0,pi/2,-pi/2,0,pi/2,0]
%joint_space = [pi/2,0,-pi/4,pi/4,-pi/2,0];%�˴����ںܶ�����ĵط�
%joint_space = [120,70,-20,10,112,-30]/180*pi
%joint_space = [120,-70,-30,10,112,-30]/180*pi
%joint_space = [120,50,-30,10,112,-30]/180*pi
%joint_space = [25 60 -135 62 -152 86]/180*pi;

% disp('���˶�ѧ���ؽڿռ��Ӧ�Ĵ��ݾ���')
% T = UR_forward_kinematics(joint_space)

disp('���˶�ѧ�����ݾ����Ӧ�Ĺؽڿռ䣺')
Ts = [eye(3) [25 25 25]';0 0 0 1]
Te = [eye(3) [50 50 50]';0 0 0 1]
theta_start = UR_reverse_kinematics(Ts)
theta_end = UR_reverse_kinematics(Te)

disp('�ٴ����˶�ѧ���ؽڿռ��Ӧ�Ĵ��ݾ���')
i=1;
ts = UR_forward_kinematics(theta_start(i,:))
te = UR_forward_kinematics(theta_end(i,:))
%t2 = UR_forward_kinematics(theta(7,:))
