function [fval, xmin, iter] = activeset(x0, G, h, A0, b)
    epsilon = 1e-8;
    omega = 1e6;
    iter = 0;
    x = x0;
    w = (abs(A0' * x - b) < epsilon);

    while true
        iter = iter + 1;
        A = A0;
        A(:, ~w) = [];
        B = zeros(sum(w), 1);
        [p, lambda0] = lagrange(G, h + G * x, A, B);
        lambda = zeros(4, 1);
        lambda((w==1),:) = lambda0;
        fval = x'* G * x /2 + h'* x + 9;
        fprintf('����������%d, ������: \n ',iter);
        disp(x);
        fprintf('f = %f\n',fval);
        if norm(p) < epsilon
            if sum(lambda < 0) == 0
                xmin = x;
                break;
            end
            %ɾ����������Լ��
            [~, q] = min(lambda);
            w(q) = 0;
            continue;
        end
        %�󲽳�
        c = A0'* p;
        disp(size(A0));
        d = b - A0' * x;

        d((w == 1 | c >= 0),:) = omega;
        c((w == 1 | c >= 0),:) = 1;
        alpha = min(1, min(d ./ c));

        % ��һ��������
        x = x + alpha * p;
        if(alpha < 1)
            %����Լ����
            [~, q] = min(d ./ c);
            w(q) = 1;
        end
    end
end