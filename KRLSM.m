function [A] = KRLSM(k1,k2,y, lambda)
    if ~exist('lambda','var') || isempty(lambda)
        lambda = 1;
    end
    [Qa,la] = eig(k1);  %k1=Qa*la*Qa'
    [Qb,lb] = eig(k2);  %k2=Qb*lb*Qb'
    l = kron(diag(lb)',diag(la));   
    inverse = l ./ (l + lambda);     
    m1 = Qa' * y * Qb;   
    m2 = m1 .* inverse;   
    
%   Z = Qa' * y * Qb.* l ./ (l + lambda);
%   A = Qa * Z * Qb'; 

    A = Qa * m2 * Qb';    % R=Qa*Z*Qb'
end
