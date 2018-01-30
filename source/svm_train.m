function [w, b, output] = svm_train(x, y, c)
    [m, n] = size(x);
    G = eye(n + m + 1);
    G((n+1):(n+m+1), (n+1):(n+m+1)) = 0;
    h = [zeros(n + 1, 1);c * ones(m, 1)];
    A0 = [x, ones(m, 1)];
    A0(1:m, :) = A0(1:m, :) .* y(1:m);
    A = [A0, eye(m); zeros(m, n + 1), eye(m)];
    B = [ones(m, 1); zeros(m, 1)];
    [xmin, ~, ~, output, ~] = quadprog(G, h, -A, -B, [], []);
    w = xmin(1:n);
    b = xmin(n + 1);
end