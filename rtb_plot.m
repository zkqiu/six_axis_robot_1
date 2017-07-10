function rtb_plot( T )
%RTB_PLOT
%   rtb_plot( T )
%   TÎªÎ»×Ë¾ØÕó

%DH-table
load DH_table

L1 = Link('d', d1, 'a', a1, 'alpha', alpha1);
L2 = Link('d', d2, 'a', a2, 'alpha', alpha2);
L3 = Link('d', d3, 'a', a3, 'alpha', alpha3);
L4 = Link('d', d4, 'a', a4, 'alpha', alpha4);
L5 = Link('d', d5, 'a', a5, 'alpha', alpha5);
L6 = Link('d', d6, 'a', a6, 'alpha', alpha6);
robot = SerialLink([L1 L2 L3 L4 L5 L6], 'name', 'my robot');
theta = UR_reverse_kinematics(T);
robot.plot(theta(1,:));
end

