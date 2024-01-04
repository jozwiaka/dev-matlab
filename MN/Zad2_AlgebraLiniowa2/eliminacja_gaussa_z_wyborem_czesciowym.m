function [x] = eliminacja_gaussa_z_wyborem_czesciowym(A, b)
    Ab = [A b];
    n = length(A);

    for i = 1:n - 1
        [M, I] = max(abs(Ab(i:n, i)));

        if M ~= Ab(i, i)
            iSwap = i + I - 1;
            temp = Ab(iSwap, :);
            Ab(iSwap, :) = Ab(i, :);
            Ab(i, :) = temp;
        end

        Ab(i + 1:n, :) = Ab(i + 1:n, :) - Ab(i, :) .* Ab(i + 1:n, i) / Ab(i, i);
    end

    A = Ab(1:n, 1:n);
    b = Ab(:, n + 1);
    x = zeros(n, 1);
    x(n, 1) = b(n, 1) / A(n, n);

    for i = 1:n - 1
        temp = A(n - i, n - i + 1:n) * x(n - i + 1:n, 1);
        x(n - i, 1) = (b(n - i, 1) - temp) / A(n - i, n - i);
    end

end
