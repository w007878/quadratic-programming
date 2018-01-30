function [x, lambda]= lagrange(G, h, A, b)
    V = (A' / G) * A;
    w = -inv(G) * h;
    B = -A' * w + b;
    lambda = inv(V) * B;
    H = A * lambda - h;
    x = inv(G) * H;
end