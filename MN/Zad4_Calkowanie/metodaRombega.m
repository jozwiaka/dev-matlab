function [c, F] = metodaRombega(f, a, b, h0, maxBlad)

    q = 2;
    F = zeros(100, 100);
    i = 0;
    koniec = false;

    while true

        F(i + 1, 1) = kwadraturaZlozona(f, 1, 3, 1, q^i + 1) / 2 * h0 / q^i;

        for j = 1:i
            poprawka = (F(i + 1, j) - F(i, j)) / (q^(j * 2) - 1);

            if abs(poprawka) < maxBlad
                c = F(i + 1, j);
                koniec = true;
            end

            F(i + 1, j + 1) = F(i + 1, j) + poprawka;

        end

        if koniec
            break;
        end

        i = i + 1;
    end

end
