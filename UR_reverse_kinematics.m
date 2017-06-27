function [ output_args ] = UR_reverse_kinematics( input_args )
%UR_REVERSE_KINEMATICS
%input_args:T;  dimension:4*4
%output_args:theta; dimension:1*6

T = input_args;
%---------------
a0 = 0;
alpha0 = 0;
d1 = 94.5;
%----------------
a1 = 0;
alpha1 = -pi/2;
d2 = 130.5;
%----------------
a2 = 425;
alpha2 = 0;
d3 = 120;
%----------------
a3 = 392.5;
alpha3 = -pi/2;
d4 = 93;
%-------------
a4 = 0;
alpha4 = -pi/2;
d5 = 93;
%--------------
a5 = 0;
alpha5 = 0;
d6 = 0;
%--------------
nx = T(1,1);ny = T(2,1);nz = T(3,1);
ox = T(1,2);oy = T(2,2);oz = T(3,2);
ax = T(1,3);ay = T(2,3);az = T(3,3);
px = T(1,4);py = T(2,4);pz = T(3,4);

E = d2+d3+d4;
F = sqrt(px^2+py^2-E^2);
theta1 = atan2(py,px)-atan2(E,-F);  %¡ÀF

s5 = -sqrt((-nx*sin(theta1)+ny*cos(theta1))^2+(-ox*sin(theta1)+oy*cos(theta1))^2);%¡Às5
theta5 = atan2(s5,ax*sin(theta1)-ay*cos(theta1));

if(abs(s5)<1e-4)
    %****
else
    theta6 = atan2((-ox*sin(theta1)+oy*cos(theta1))/s5,(nx*sin(theta1)-ny*cos(theta1))/s5);
    theta234 = atan2(az/s5,-(ax*cos(theta1)+ay*sin(theta1))/s5);
end

N = pz-d1+d5*cos(theta234);
A = 2*a2*N;
M = px*cos(theta1)+py*sin(theta1)+d5*sin(theta234);
B = 2*a2*M;
C = M^2+N^2+a2^2-a3^2;

theta2 = atan2(B,A)-atan2(C,sqrt(A^2+B^2-C^2));%¡Àsqrt(A^2+B^2-C^2)
theta23 = atan2(-(N+a2*sin(theta2))/a3,(M-a2*cos(theta2))/a3);
theta3 = theta23-theta2;
theta3 = minmax(theta3);
theta4 = theta234-theta23;
theta4 = minmax(theta4);
output_args = [theta1,theta2,theta3,theta4,theta5,theta6];
end

