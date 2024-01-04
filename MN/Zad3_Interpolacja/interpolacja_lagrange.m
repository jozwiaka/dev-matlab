function y = interpolacja_lagrange(X, Y, x)
    n = length(X);
    y = 0;

    for i = 1:n
        X_without_i_element = X([1:i - 1, i + 1:end]);
        [p] = poly(X_without_i_element);
        L = polyval(p, x);
        M = polyval(p, X(i));
        y = y + Y(i) * L / M;
    end

end

% fi=Y(i)
% xi=X(i)
% xk=X(k)
% x=x?
