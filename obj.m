function y=obj(x, file_address)
% function y=obj(x)
% First n variables of x are Pr(0|0), 
% last n variables of x are Pr(1|1)
    n = length(x)/2;
    p0m0 = x(1:n);
    p1m1 = x(n+1:2*n);
    As = zeros(2,2,n);
    % Construct matrix under ind assumption
    for i = 1:n
        As(:,:,i) = [[p0m0(i) 1-p1m1(i)];...
            [1-p0m0(i) p1m1(i)]];
    end
    
    A_ind = As(:,:,1);
    for j = 2:n
        A_ind = kron(A_ind, As(:,:,j));
    end

%     res = [[1-p0m0(1) p1m1(1)];[p0m0(1) 1-p1m1(1)]];
%     for j = 2:n
%         res = kron(res, [[1-p0m0(j) p1m1(j)];[p0m0(j) 1-p1m1(j)]]);
%     end
    

    A_full = readmatrix(strcat(file_address,'/Afull.txt'));
       
    y = norm(A_full - A_ind,'fro')^2;
end