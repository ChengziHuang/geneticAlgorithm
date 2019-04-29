function poltd(x, y, tour)
    [w, l] = size(tour);
    for i = 1 : w
        xdata = [x(tour(i, 1)) x(tour(i, 2))];
        ydata = [y(tour(i, 1)) y(tour(i, 2))];
        plot(xdata, ydata, '--' ,'Color', 'r', 'LineWidth', 1.5)
    end
end