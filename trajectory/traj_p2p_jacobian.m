function THETA = traj_p2p_jacobian( T_start,T_end )
%TRAJ_P2P_JACOBIAN 
%   �㵽���˶�
%   �����ſ˱ȵ�����

THETA = ones(101,6);
a = UR_reverse_kinematics(T_start);
THETA(1,:) = (a(1,:))';

%��ȡʼĩ����
start_point = T_start(1:3,4);
end_point = T_end(1:3,4);

X = -start_point(1)+end_point(1);
Y = -start_point(2)+end_point(2);
Z = -start_point(3)+end_point(3);

dx = X/100;
dy = Y/100;
dz = Z/100;

DeltaX = [dx;dy;dz;0;0;0];

for i = 2:101
    cond(UR_Jacobian(THETA(i-1,:)))
    DeltaTheta = (UR_Jacobian(THETA(i-1,:)))\DeltaX;
    THETA(i,:) = THETA(i-1,:)+DeltaTheta';
end

end

