function w = wielomian_interpolacyjny_lagrangea(X, Y)
    n = length(X);
    w = 0;

    for i = 1:n
        X_without_i_element = X([1:i - 1, i + 1:end]);
        [p] = poly(X_without_i_element);
        M = polyval(p, X(i));
        w = w + Y(i) * p / M;
    end

end
