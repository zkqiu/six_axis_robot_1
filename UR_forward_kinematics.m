function [ output_args ] = UR_forward_kinematics( input_args )
%UR_FORWARD_KINEMATICS 
%exp:[ output_args ] = UR_forward_kinematics( input_args )
%input_args:joint space;dimension:1*6
%output_args:operation space;dimension:4*4

%DH-table
%--------------------------------
a1 = 0;
alpha1 = pi/2;
d1 = 181;
theta1 = input_args(1);
%-------------------------------
a2 = 522;
alpha2 = 0;
d2 = 0;
theta2 = input_args(2);
%-------------------------------
a3 = 391;
alpha3 = 0;
d3 = 0;
theta3 = input_args(3);
%------------------------------
a4 = 0;
alpha4 = pi/2;
d4 = 141.5;
theta4 = input_args(4);
%------------------------------
a5 = 0;
alpha5 = -pi/2;
d5 = 187;
theta5 = input_args(5);
%-------------------------------
a6 = 0;
alpha6 = 0;
d6 = 113;
theta6 = input_args(6);
%------------------------------------

T_0_1 = ...
    [cos(theta1),-sin(theta1)*cos(alpha1),sin(theta1)*sin(alpha1),a1*cos(theta1);
    sin(theta1),cos(theta1)*cos(alpha1),-cos(theta1)*sin(alpha1),a1*sin(theta1);
    0,sin(alpha1),cos(alpha1),d1;
    0,0,0,1];
T_1_2 = ...
    [cos(theta2),-sin(theta2)*cos(alpha2),sin(theta2)*sin(alpha2),a2*cos(theta2);
    sin(theta2),cos(theta2)*cos(alpha2),-cos(theta2)*sin(alpha2),a2*sin(theta2);
    0,sin(alpha2),cos(alpha2),d2;
    0,0,0,1];
T_2_3 = ...
    [cos(theta3),-sin(theta3)*cos(alpha3),sin(theta3)*sin(alpha3),a3*cos(theta3);
    sin(theta3),cos(theta3)*cos(alpha3),-cos(theta3)*sin(alpha3),a3*sin(theta3);
    0,sin(alpha3),cos(alpha3),d3;
    0,0,0,1];
T_3_4 = ...
    [cos(theta4),-sin(theta4)*cos(alpha4),sin(theta4)*sin(alpha4),a4*cos(theta4);
    sin(theta4),cos(theta4)*cos(alpha4),-cos(theta4)*sin(alpha4),a4*sin(theta4);
    0,sin(alpha4),cos(alpha4),d4;
    0,0,0,1];
T_4_5 = ...
    [cos(theta5),-sin(theta5)*cos(alpha5),sin(theta5)*sin(alpha5),a5*cos(theta5);
    sin(theta5),cos(theta5)*cos(alpha5),-cos(theta5)*sin(alpha5),a5*sin(theta5);
    0,sin(alpha5),cos(alpha5),d5;
    0,0,0,1];
T_5_6 = ...
    [cos(theta6),-sin(theta6)*cos(alpha6),sin(theta6)*sin(alpha6),a6*cos(theta6);
    sin(theta6),cos(theta6)*cos(alpha6),-cos(theta6)*sin(alpha6),a6*sin(theta6);
    0,sin(alpha6),cos(alpha6),d6;
    0,0,0,1];

output_args = T_0_1*T_1_2*T_2_3*T_3_4*T_4_5*T_5_6;
end

