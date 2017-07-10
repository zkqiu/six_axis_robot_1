function output = get_best_theta( theta,ref )
%GET_BEST_THETA 
%   output = get_best_theta( theta,ref )
%   在theta中选择与ref距离最小的那个向量

row = size(theta,1);
output = theta(1,:);
min = norm(output-ref);
for i = 2:row
    if(norm(theta(i,:)-ref)<min)
        output = theta(i,:);
        min = norm(theta(i,:)-ref);
    end
end
end

