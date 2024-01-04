function BadanieWplywuZaburzen
    c = logspace(2, 10, 100);
    n = 8;
    y_A_element = zeros(1, length(c));
    y_A_kolumna = zeros(1, length(c));
    y_A_caly = zeros(1, length(c));
    y_b_caly = zeros(1, length(c));
    w_uwar = y_b_caly;

    for i = 1:length(c)
        [A, b, x] = tstcnd(n, c(i));

        delta_A_element = rand(size(1)) * norm(A) * 0.00001;
        A_element = A;
        A_element(1, 1) = A(1, 1) + delta_A_element;
        x_A_element = linsolve(A_element, b);

        delta_A_kolumna = rand(size(b)) * norm(A) * 0.00001;
        A_kolumna = A;
        A_kolumna(:, 1) = A(:, 1) + delta_A_kolumna;
        x_A_kolumna = linsolve(A_kolumna, b);

        delta_A_caly = rand(size(A)) * norm(A) * 0.00001;
        A_caly = A + delta_A_caly;
        x_A_caly = linsolve(A_caly, b);

        delta = rand(size(b)) * norm(b) * 0.00001;
        b_zaburzony = b + delta;
        x_zaburzony = A \ b_zaburzony;
        %bledy wzgledne x

        dx_A_element = norm(x_A_element - x) / norm(x);
        dx_A_kolumna = norm(x_A_kolumna - x) / norm(x);
        dx_A_caly = norm(x_A_caly - x) / norm(x);
        dx_b_caly = norm(x_zaburzony - x) / norm(x);
        %bledy wzgledne zaburzen
        dblad_A_element = norm(delta_A_element) / norm(A);
        y_A_element(i) = dx_A_element / dblad_A_element;

        dblad_A_kolumna = norm(delta_A_kolumna) / norm(A);
        y_A_kolumna(i) = dx_A_kolumna / dblad_A_kolumna;

        dblad_A_caly = norm(delta_A_caly) / norm(A);
        y_A_caly(i) = dx_A_caly / dblad_A_caly;

        dblad_b_caly = norm(delta) / norm(b);
        y_b_caly(i) = dx_b_caly / dblad_b_caly;

        w_uwar(i) = norm(A) * norm(inv(A));
    end

    loglog(w_uwar, y_A_element, '*')
    hold on;
    loglog(w_uwar, y_A_kolumna, '*')
    loglog(w_uwar, y_A_caly, '*')
    loglog(w_uwar, y_b_caly, '*')
    loglog(c, c)
    legend("y A element", "y A kolumna", "y A caly", "y b caly", "c=c")
    hold off;
