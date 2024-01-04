function [z] = sredniModulBleduAproksymacji2(f, numberOfPoints)

    z = 0;
    x = linspace(0, 3, numberOfPoints);
    y = f(x);
    [p, S] = polyfit(x, y, 8);
    x = linspace(0, 3, 301);
    y = f(x);
    [w] = polyval(p, x, S);

    for i = 1:length(x)
        z = z + abs(y(i) - w(i));
    end

    z = z / length(x);
end
