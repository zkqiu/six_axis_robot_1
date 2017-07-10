clear;clc

Ts = [eye(3) [20 20 50]';0 0 0 1];
Te = [eye(3) [50 50 50]';0 0 0 1];
%rtb_animation(Ts,Te)
rtb_plot(Ts)