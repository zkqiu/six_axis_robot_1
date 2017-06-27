syms theta1 theta2 theta3 theta4 theta5 theta6;
syms a0 a1 a2 a3 a4 a5;
syms alpha0 alpha1 alpha2 alpha3 alpha4 alpha5;
syms d1 d2 d3 d4 d5 d6;

T_0_1 = [cos(theta1),-sin(theta1),0,0;
    sin(theta1),cos(theta1),0,0;
    0,0,1,d1;
    0,0,0,1];
T_1_2 = [cos(theta2),-sin(theta2),0,0;
    0,0,1,d2;
    -sin(theta2),-cos(theta2),0,0;
    0,0,0,1];
T_2_3 = [cos(theta3),-sin(theta3),0,a2;
    sin(theta3),cos(theta3),0,0;
    0,0,1,d3;
    0,0,0,1];
T_3_4 = [cos(theta4),-sin(theta4),0,a3;
    sin(theta4),cos(theta4),0,0;
    0,0,1,d4;
    0,0,0,1];
T_4_5 = [cos(theta5),-sin(theta5),0,0;
    0,0,1,d5;
    -sin(theta5),-cos(theta5),0,0;
    0,0,0,1];
T_5_6 = [cos(theta6),-sin(theta6),0,0;
    0,0,1,0;
    -sin(theta6),-cos(theta6),0,0;
    0,0,0,1];

T_0_6 = T_0_1*T_1_2*T_2_3*T_3_4*T_4_5*T_5_6;
T_0_6 = simplify(T_0_6)
T_1_6 = T_1_2*T_2_3*T_3_4*T_4_5*T_5_6;
T_1_6 = simplify(T_1_6)
