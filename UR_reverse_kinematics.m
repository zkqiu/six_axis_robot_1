function UR_reverse_kinematics( input_args )
%UR_REVERSE_KINEMATICS
%input_args:T;  dimension:4*4
%output_args:theta; dimension:1*6

T = input_args;
%--------------------------------
a1 = 0;
alpha1 = pi/2;
d1 = 181;
%-------------------------------
a2 = 522;
alpha2 = 0;
d2 = 0;
%-------------------------------
a3 = 391;
alpha3 = 0;
d3 = 0;
%------------------------------
a4 = 0;
alpha4 = pi/2;
d4 = 141.5;
%------------------------------
a5 = 0;
alpha5 = -pi/2;
d5 = 187;
%-------------------------------
a6 = 0;
alpha6 = 0;
d6 = 113;
%------------------------------------
nx = T(1,1);ny = T(2,1);nz = T(3,1);
ox = T(1,2);oy = T(2,2);oz = T(3,2);
ax = T(1,3);ay = T(2,3);az = T(3,3);
px = T(1,4);py = T(2,4);pz = T(3,4);

% syms theta1 real
% [theta1,theta5] = solve(d4+d6*cos(theta5)==sin(theta1)*px-cos(theta1)*py,cos(theta5)==sin(theta1)*ax-cos(theta1)*ay)
% theta1 = vpa(theta1);
% theta5 = vpa(theta5);
% theta1 = double(solve(sin(theta1)*(px-d6*ax)-d4==cos(theta1)*(py-d6*ay)))
% theta5 = acos(sin(theta1)*ax-cos(theta1)*ay)
% theta6 = atan2(-(sin(theta1)*ox-cos(theta1)*oy),sin(theta1)*nx-cos(theta1)*ny)
% E = d2+d3+d4;
% F = sqrt(px^2+py^2-E^2);
% theta1 = atan2(py,px)-atan2(E,-F);  %¡ÀF
% 
% s5 = -sqrt((-nx*sin(theta1)+ny*cos(theta1))^2+(-ox*sin(theta1)+oy*cos(theta1))^2);%¡Às5
% theta5 = atan2(s5,ax*sin(theta1)-ay*cos(theta1));
% 
% if(abs(s5)<1e-4)
%     %****
% else
%     theta6 = atan2((-ox*sin(theta1)+oy*cos(theta1))/s5,(nx*sin(theta1)-ny*cos(theta1))/s5);
%     theta234 = atan2(az/s5,-(ax*cos(theta1)+ay*sin(theta1))/s5);
% end
% 
% N = pz-d1+d5*cos(theta234);
% A = 2*a2*N;
% M = px*cos(theta1)+py*sin(theta1)+d5*sin(theta234);
% B = 2*a2*M;
% C = M^2+N^2+a2^2-a3^2;
% 
% theta2 = atan2(B,A)-atan2(C,sqrt(A^2+B^2-C^2));%¡Àsqrt(A^2+B^2-C^2)
% theta23 = atan2(-(N+a2*sin(theta2))/a3,(M-a2*cos(theta2))/a3);
% theta3 = theta23-theta2;
% theta3 = minmax(theta3);
% theta4 = theta234-theta23;
% theta4 = minmax(theta4);
%output_args = [theta1,theta2,theta3,theta4,theta5,theta6];
end

