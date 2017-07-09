function theta = UR_reverse_kinematics( input_args )
%UR_REVERSE_KINEMATICS
%input_args:T;  dimension:4*4
%output_args:theta; dimension:1*6

theta = zeros(8,6);
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
%----------------------------------------------------
%STEP1 求解thea1  2个
A = px-d6*ax;
B = d6*ay-py;
C = d4;
if(A^2+B^2<C^2)
    error('message')
end
theta(1:4,1) = atan2(C,sqrt(A^2+B^2-C^2))-atan2(B,A);
theta(1:4,1)=minmax(theta(1:4,1));
theta(5:8,1) = atan2(C,-sqrt(A^2+B^2-C^2))-atan2(B,A);
theta(5:8,1)=minmax(theta(5:8,1));
%-------------------------------------------------------
%STEP2 求解theta5  4个
for i = 1:4:7
    %s5 = sqrt((nx*sin(theta(i,1))-ny*cos(theta(i,1)))^2+(ox*sin(theta(i,1))-oy*cos(theta(i,1)))^2);
    c5 = ax*sin(theta(i,1))-ay*cos(theta(i,1));
    s5 = sqrt(1-c5^2);
    theta(i:(i+1),5) = atan2(s5,c5);
    theta(i:(i+1),5)=minmax(theta(i:(i+1),5));
    theta((i+2):(i+3),5) = atan2(-s5,c5);
    theta((i+2):(i+3),5)=minmax(theta((i+2):(i+3),5));
    
end
%-----------------------------------------------------
%STEP3 求解theta6  4个
for i = 1:2:7
    s6 = (ox*sin(theta(i,1))-oy*cos(theta(i,1)))/(-sin(theta(i,5)));
    c6 = (nx*sin(theta(i,1))-ny*cos(theta(i,1)))/sin(theta(i,5));
    theta(i:(i+1),6) = atan2(s6,c6);
    theta(i:(i+1),6) =minmax(theta(i:(i+1),6) );
    
end
%-----------------------------------------------------
%STEP4 求解theta234  4个
theta234 = ones(1,8);
for i = 1:2:7
    s234 = az/(-sin(theta(i,5)));
    c234 = (ax*cos(theta(i,1))+ay*sin(theta(i,1)))/(-sin(theta(i,5)));
    theta234(i:(i+1)) = atan2(s234,c234);
end
%--------------------------------------------------------
%STEP5 求解theta2  8个
for i = 1:2:7
    s234 = az/(-sin(theta(i,5)));
    c234 = (ax*cos(theta(i,1))+ay*sin(theta(i,1)))/(-sin(theta(i,5)));
    AA = a3;
    BB = a2;
    CC = px*cos(theta(i,1))+py*sin(theta(i,1))-d5*s234+d6*sin(theta(i,5))*c234;
    DD = pz-d1+d5*c234+d6*sin(theta(i,5))*s234;
    A = 2*BB*DD;
    B = 2*BB*CC;
    C = CC^2+DD^2+BB^2-AA^2;
%     atan2(B,-A)
%     sqrt(A^2+B^2-C^2)
%     atan2(C,sqrt(A^2+B^2-C^2))
    if(A^2+B^2<C^2)
        theta(i,2)=0;
        theta(i+1,2)=0;
        disp('有问题')
        continue
    end
    theta(i,2) = atan2(C,sqrt(A^2+B^2-C^2))-atan2(B,A);
    theta(i,2) = minmax(theta(i,2));
    theta(i+1,2) = atan2(C,-sqrt(A^2+B^2-C^2))-atan2(B,A);
    theta(i+1,2) = minmax(theta(i+1,2));
end
%-----------------------------------------------------------
%STEP6 求解theta23  8个
theta23 = ones(1,8);
for i = 1:8
    s234 = az/(-sin(theta(i,5)));
    c234 = (ax*cos(theta(i,1))+ay*sin(theta(i,1)))/(-sin(theta(i,5)));
    s23 = ((pz-d1+d5*c234)+d6*sin(theta(i,5))*s234-a2*sin(theta(i,2)))/a3;
    c23 = (px*cos(theta(i,1))+py*sin(theta(i,1))-d5*s234+d6*sin(theta(i,5))*c234-a2*cos(theta(i,2)))/a3;
    theta23(i) = atan2(s23,c23);
end
%--------------------------------------------------------------
%STEP7 求解theta3  8个
for i = 1:8
    theta(i,3) = theta23(i)-theta(i,2);
    theta(i,3) = minmax(theta(i,3));
end
%----------------------------------------------
%STEP8 求解theta4  8个
for i = 1:8
    theta(i,4) = theta234(i)-theta23(i);
    theta(i,4) = minmax(theta(i,4));
end
%-----------------------------------------------


end

