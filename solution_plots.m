clc;clear;close all;
% Author: Muqing Zheng

% p0m0 = sym("e", [2 1], 'real'); % epsilon
% p1m1 = sym("x", [2 1], 'real');

% r = 1.05; % p0m0/p1m1
% x = 0.8:0.001:1; %p0m0 for qubit 0
% y = 0.8:0.001:1; %p0m0 for qubit 1
% [X,Y] = meshgrid(x,y);
% [size1, size2] = size(X);
% Z = zeros(size1, size2); 
% for i = 1:size1
%     for j = 1:size2
%         Z(i,j) = obj([X(i,j), Y(i,j), r*X(i,j),  r*Y(i,j)]); 
%     end
% end
% f = figure(1);
% mesh(X,Y,Z);
% xlabel('Pr(0|0) for qubit 0');
% ylabel('Pr(0|0) for qubit 1');
% title('||A_{full}-A_{ind}||_F^2');
%% Optimization
% First n variables of x are Pr(0|0), 
% last n variables of x are Pr(1|1)

num_qubits = 3;
file_address = 'LimaData';

x0 = ones(1,2*num_qubits)*0.9;
f = @(x) obj(x, file_address);
[xopt,fval,exitflag,output] = fminsearch(f, x0);
writematrix(xopt, strcat(file_address,'/Aopt.txt'));