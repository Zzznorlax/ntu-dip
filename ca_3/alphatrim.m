function y = alphatrim(x, d, k_size)
%Alpha-trimmed mean filter
%   Detailed explanation goes here

    [M, N] = size(x);
    y = zeros(size(x));

    for n = 1 + k_size:N - k_size
        for m = 1 + k_size:M - k_size
            % Extract a window of size (2r+1)x(2r+1) around (m,n)
            w = x(m + (-k_size:k_size),n + (-k_size:k_size));

            w = sort(w(:));
            y(m, n) = mean(w(floor(1+d/2):floor(end-d/2)));
        end
    end
end
