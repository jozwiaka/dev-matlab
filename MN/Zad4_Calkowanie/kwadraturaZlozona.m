function [calka, wspolczynniki] = kwadraturaZlozona(fun, a, b, n, liczbaPunktow)

    x = linspace(a, b, liczbaPunktow);
    calka = 0;
    ns = [2 6 8 90 288 840];
    calka = 0;
    temp = 0;
    w1 = [1 1];
    w2 = [1 4 1];
    w3 = [1 3 3 1];
    w4 = [7 32 12 32 7];
    w5 = [19 75 50 50 75 19];
    w6 = [41 216 27 272 27 216 41];
    w = [w1 zeros(1, 5);
        w2 zeros(1, 4);
        w3 zeros(1, 3);
        w4 zeros(1, 2);
        w5 zeros(1, 1);
        w6];

    liczbaPunktowWymagajacychMniejszejKwadratury = liczbaPunktow;
    liczbaPrzedzialow = 0;

    while true

        if liczbaPunktowWymagajacychMniejszejKwadratury < n + 1
            liczbaPunktowWymagajacychMniejszejKwadratury = liczbaPunktowWymagajacychMniejszejKwadratury - 1;
            break;
        end

        liczbaPunktowWymagajacychMniejszejKwadratury = liczbaPunktowWymagajacychMniejszejKwadratury - (n + 1);
        liczbaPunktowWymagajacychMniejszejKwadratury = liczbaPunktowWymagajacychMniejszejKwadratury + 1;
        liczbaPrzedzialow = liczbaPrzedzialow + 1;
    end

    wspolczynniki = zeros(1, liczbaPunktow);

    for i = 1:liczbaPrzedzialow
        wspolczynniki(1, 1 + (i - 1) * n:n + 1 + (i - 1) * n) = wspolczynniki(1, 1 + (i - 1) * n:n + 1 + (i - 1) * n) + w(n, 1:n + 1);
    end

    %liczbaPunktowWymagajacychMniejszejKwadratury = liczbaPunktow - (n + 1) - (liczbaPrzedzialow - 1) * n;

    if liczbaPunktowWymagajacychMniejszejKwadratury ~= 0
        wspolczynniki(1, (end - liczbaPunktowWymagajacychMniejszejKwadratury):end) = wspolczynniki(1, end - liczbaPunktowWymagajacychMniejszejKwadratury:end) + w(liczbaPunktowWymagajacychMniejszejKwadratury, 1:liczbaPunktowWymagajacychMniejszejKwadratury + 1);
    end

    calka = (b - a) / ns(n) * (fun(x) * wspolczynniki');
    % calka = (b - a) / ns(n) * (fun(x) * wspolczynniki') / (liczbaPunktow - 1);

end
