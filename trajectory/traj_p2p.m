function THETA = traj_p2p( T_start,T_end )
%TRAJ_P2P
%   从一个点到另一个点
%   仅位置变化  姿态不变
%   THETA行数为插值的点的个数

%错误检验

R = T_start(1:3,1:3);
ref = [0 0 0 0 0 0];  %初始关节空间
%获取始末两点
start_point = T_start(1:3,4);
end_point = T_end(1:3,4);
len = norm(start_point-end_point);

%直线插值
X = linspace(start_point(1),end_point(1),floor(len));
Y = linspace(start_point(2),end_point(2),floor(len));
Z = linspace(start_point(3),end_point(3),floor(len));
P = [X;Y;Z];  %P的每一列均为一个点
column = size(P,2);
THETA = ones(column,6);

for i = 1:column
    T = [R P(:,i);0 0 0 1];
    theta = UR_reverse_kinematics(T);
    THETA(i,:) = get_best_theta(theta,ref);
    ref = THETA(i,:);
end

end

