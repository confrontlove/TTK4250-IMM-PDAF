function lse = logSumExp(a)
    % more numerically stable way(less chance of underflow and overflow)
    % to calculate logsumexp of a list, a.
    % 
    % uses the fact
    % log(sum(exp(a))) = log(sum(exp(b)exp(a - b))
    % = log(exp(b)sum(exp(a - b))) = b + log(sum(exp(a - b)))
    % where we let b = max(a), 
    amax = max(a(:));
    lse = amax + log(sum(exp(a - amax)));
end