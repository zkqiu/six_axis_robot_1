function THETA = traj_p2p( T_start,T_end )
%TRAJ_P2P
%   ��һ���㵽��һ����
%   ��λ�ñ仯  ��̬����
%   THETA����Ϊ��ֵ�ĵ�ĸ���

%�������

R = T_start(1:3,1:3);
ref = [0 0 0 0 0 0];  %��ʼ�ؽڿռ�
%��ȡʼĩ����
start_point = T_start(1:3,4);
end_point = T_end(1:3,4);
len = norm(start_point-end_point);

%ֱ�߲�ֵ
X = linspace(start_point(1),end_point(1),floor(len));
Y = linspace(start_point(2),end_point(2),floor(len));
Z = linspace(start_point(3),end_point(3),floor(len));
P = [X;Y;Z];  %P��ÿһ�о�Ϊһ����
column = size(P,2);
THETA = ones(column,6);

for i = 1:column
    T = [R P(:,i);0 0 0 1];
    theta = UR_reverse_kinematics(T);
    THETA(i,:) = get_best_theta(theta,ref);
    ref = THETA(i,:);
end

end

