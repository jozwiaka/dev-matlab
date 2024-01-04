function [z] = sredniModulBleduAproksymacji(x, y, n)
    [p, S] = polyfit(x, y, n);
    [w] = polyval(p, x, S);
    z=0;

    for i=1:length(x)
        z = z + abs(y(i) - w(i));
    end

    z = z / length(x);
end
