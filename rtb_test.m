clear;clc

%DH-table
load DH_table

L1 = Link('d', d1, 'a', a1, 'alpha', alpha1);
L2 = Link('d', d2, 'a', a2, 'alpha', alpha2);
L3 = Link('d', d3, 'a', a3, 'alpha', alpha3);
L4 = Link('d', d4, 'a', a4, 'alpha', alpha4);
L5 = Link('d', d5, 'a', a5, 'alpha', alpha5);
L6 = Link('d', d6, 'a', a6, 'alpha', alpha6);
robot = SerialLink([L1 L2 L3 L4 L5 L6], 'name', 'my robot');

%joint_space = [120,70,-30,10,112,-30]/180*pi
joint_space = [25 60 -135 62 -152 86]/180*pi;
T = robot.fkine(joint_space)
theta = robot.ikine(T)
%theta = robot.ikine(T,'pinv')
%theta = robot.ikine6s(T,'rdf')