function C = wielomian_interpolacyjny_rodzina_trojkatna(X, Y)
    n = length(X);
    A = zeros(n);
    C = zeros(n, 1);
    A(:, 1) = 1;

    for i = 1:n
        temp = 1;

        for j = 2:i
            temp = temp * (X(i) - X(j - 1));
            A(i, j) = temp;
        end

    end

    C = A \ Y;
end
