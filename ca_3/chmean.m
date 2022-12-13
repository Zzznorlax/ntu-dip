function y = chmean(x, q, k_size)
%UNTITLED Summary of this function goes here
%   Detailed explanation goes here

    [M, N] = size(x);
    y = zeros(size(x));
    
    for n = 1 + k_size:N - k_size
        for m = 1 + k_size:M - k_size
            % Extract a window of size (2r+1)x(2r+1) around (m,n)
            w = x(m + (-k_size:k_size),n + (-k_size:k_size));
    
            y(m, n) = sum(w.^(q + 1)) / sum(w.^q);
        end
    end
end