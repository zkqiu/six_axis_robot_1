function [ output_args ] = minmax( input_args )
%MINMAX    modify by qzk
%make input_args��[-pi,pi]

while(input_args>pi)
    input_args = input_args - 2*pi;
end

while(input_args<-pi)
    input_args = input_args + 2*pi;
end

output_args = input_args;
end

