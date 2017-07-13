% D-H Table
clear;clc
theta1 = 0;  d1 =18.1;    a1 = 0;       alpha1 = pi/2;
theta2 = 0;  d2 = 0;      a2 = 52.2;    alpha2 = 0;
theta3 = 0;  d3 = 0;      a3 = 39.1;    alpha3 = 0;
theta4 = 0;  d4 = 14.15;  a4 = 0;       alpha4 = pi/2;
theta5 = 0;  d5 = 18.7;   a5 = 0;       alpha5 = -pi/2;
theta6 = 0;  d6 = 11.3;   a6 = 0;       alpha6 = 0;

L(1) = Link([theta1,d1,a1,alpha1,0]);
L(2) = Link([theta2,d2,a2,alpha2,0]);
L(3) = Link([theta3,d3,a3,alpha3,0]);
L(4) = Link([theta4,d4,a4,alpha4,0]);
L(5) = Link([theta5,d5,a5,alpha5,0]);
L(6) = Link([theta6,d6,a6,alpha6,0]);


six_link = SerialLink(L, 'name', 'SixLink');

qt = [ 2.0944    1.2217   -0.3491    0.1745    1.9548   -0.5236];
%qr = ones(1,6)*pi*2;
%t = [0:0.05:5]';
%q = jtraj(qz,qr,t);
figure(1);
q=qt;
six_link.plot(q);

six_link.teach();