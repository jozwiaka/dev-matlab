function wezlyCzebyszewa = wezlyCzebyszewa(n)
    wezlyCzebyszewa = zeros(1, n);

    for k = 0:n
        wezlyCzebyszewa(k + 1) = cos((2 * k + 1) * pi / (2 * (n + 1)));
    end

end
