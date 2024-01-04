function c = calkuj(fun, a, b, n)
    ns = [2 6 8 90 288 840];
    c = 0;
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

    x = linspace(a, b, n + 1);
    c = (b - a) / ns(n) * (fun(x) * w(n, 1:n + 1)');
end
