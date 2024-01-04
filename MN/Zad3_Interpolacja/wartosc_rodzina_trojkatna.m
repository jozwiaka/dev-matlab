function y = wartosc_rodzina_trojkatna(X, Y, x)
    y = zeros(length(x), 1);
    C = wielomian_interpolacyjny_rodzina_trojkatna(X, Y);

    for k = 1:length(x)
        y_inter = C(1);

        for i = 1:length(X) - 1
            temp = 1;

            for j = 1:i
                temp = temp * (x(k) - X(j));
            end

            y_inter = y_inter + C(i + 1) * temp;
        end

        y(k) = y_inter;
    end

end
