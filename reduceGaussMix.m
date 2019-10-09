function [xmix, Pmix] = reduceGaussMix(w, x, P)
    % calculates the mean, xmix, and covariance, Pmix, of a mixture 
    %   p(y) = sum_i w(i)*N(y; x(:, i), P(:, :, i))
    %
    % w (numel(w) x #mix): weights of the mixture
    % x (dim(state) x #mix): means of the mixture
    % P (dims(state) x dim(state) x #mix): covariances of the mixture
    %
    % xmix (dim(state)): total mean
    % Pmix (dim(state) x dim(state)): total covariance
     
    w = w(:);
    %M = numel(w);
    M = size(x, 2);
    n = size(x, 1);

    %% implementation
    % allocate
    xmix = zeros(n, 1);
    Pmix = zeros(n, n);
    Ptilde = zeros(n, n);

    for i=1:M
        xmix = xmix + w(i)*x(:, i);
        Ptilde = Ptilde + w(i)*x(:, i)*x(:, i)';
        Pmix = Pmix + w(i)*P(:, :, i);
    end
    
    Ptilde = Ptilde - xmix*xmix';
    Pmix = Pmix + Ptilde;
end

