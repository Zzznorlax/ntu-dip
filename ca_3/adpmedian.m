function y = adpmedian(x, k)
%Adaptive median filter
%   Detailed explanation goes here

    [M, N] = size(x);
    y = zeros(size(x));

    k_size = k;

    for n = 1 + k_size:N - k_size
        for m = 1 + k_size:M - k_size

            w = x(m + (-k_size:k_size),n + (-k_size:k_size));

            s_max = max(max(w));
            s_min = min(min(w));
            s_med = median(w, "all");

            while s_med == s_max || s_med == s_min
                k_size = k_size + 1;

                top = max([1, m - k_size]);
                bottom = min([m + k_size, M]);
                left = max([1, n - k_size]);
                right = min([n + k_size, N]);

                w = x(top:bottom, left:right);
                s_max = max(max(w));
                s_min = min(min(w));
                s_med = median(w, "all");
            end

            if s_min < x(m, n) && x(m, n) < s_max
                y(m, n) = x(m, n);
            else
                y(m, n) = s_med;
            end

            k_size = k;
        end
    end
end
