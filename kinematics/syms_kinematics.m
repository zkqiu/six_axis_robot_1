clear;clc

syms theta1 theta2 theta3 theta4 theta5 theta6;
syms a1 a2 a3 a4 a5 a6;
syms alpha1 alpha2 alpha3 alpha4 alpha5 alpha6;
syms d1 d2 d3 d4 d5 d6;

T_0_1 = ...
    [cos(theta1),0,sin(theta1),0;
    sin(theta1),0,-cos(theta1),0;
    0,1,0,d1;
    0,0,0,1];
T_1_2 = ...
    [cos(theta2),-sin(theta2),0,a2*cos(theta2);
    sin(theta2),cos(theta2),0,a2*sin(theta2);
    0,0,1,0;
    0,0,0,1];
T_2_3 = ...
    [cos(theta3),-sin(theta3),0,a3*cos(theta3);
    sin(theta3),cos(theta3),0,a3*sin(theta3);
    0,0,1,0;
    0,0,0,1];
T_3_4 = ...
    [cos(theta4),0,sin(theta4),0;
    sin(theta4),0,-cos(theta4),0;
    0,1,0,d4;
    0,0,0,1];
T_4_5 = ...
    [cos(theta5),0,-sin(theta5),0;
    sin(theta5),0,cos(theta5),0;
    0,-1,0,d5;
    0,0,0,1];
T_5_6 = ...
    [cos(theta6),-sin(theta6),0,0;
    sin(theta6),cos(theta6),0,0;
    0,0,1,d6;
    0,0,0,1];

T_0_1 = T_0_1;
T_0_2 = T_0_1*T_1_2;
T_0_3 = T_0_1*T_1_2*T_2_3;
T_0_4 = T_0_1*T_1_2*T_2_3*T_3_4;
T_0_5 = T_0_1*T_1_2*T_2_3*T_3_4*T_4_5;
T_0_6 = T_0_1*T_1_2*T_2_3*T_3_4*T_4_5*T_5_6;
% T_0_6 = simplify(T_0_6)
% T_1_6 = T_1_2*T_2_3*T_3_4*T_4_5*T_5_6;
% T_1_6 = simplify(T_1_6)
% T_1_0 = simplify(inv(T_0_1))

T_0_1 = simplify(T_0_1);
T_0_2 = simplify(T_0_2);
T_0_3 = simplify(T_0_3);
T_0_4 = simplify(T_0_4);
T_0_5 = simplify(T_0_5);
T_0_6 = simplify(T_0_6);

z_0_0 = [0;0;1];
z_0_1 = T_0_1(1:3,3);
z_0_2 = T_0_2(1:3,3);
z_0_3 = T_0_3(1:3,3);
z_0_4 = T_0_4(1:3,3);
z_0_5 = T_0_5(1:3,3);
z_0_6 = T_0_6(1:3,3);

p_0_0 = [0;0;0];
p_0_1 = T_0_1(1:3,4);
p_0_2 = T_0_2(1:3,4);
p_0_3 = T_0_3(1:3,4);
p_0_4 = T_0_4(1:3,4);
p_0_5 = T_0_5(1:3,4);
p_0_6 = T_0_6(1:3,4);

J1 = [cross(z_0_0,p_0_6-p_0_0);z_0_0]
J2 = [cross(z_0_1,p_0_6-p_0_1);z_0_1]
J3 = [cross(z_0_2,p_0_6-p_0_2);z_0_2]
J4 = [cross(z_0_3,p_0_6-p_0_3);z_0_3]
J5 = [cross(z_0_4,p_0_6-p_0_4);z_0_4]
J6 = [cross(z_0_5,p_0_6-p_0_5);z_0_5]
J = [J1,J2,J3,J4,J5,J6]