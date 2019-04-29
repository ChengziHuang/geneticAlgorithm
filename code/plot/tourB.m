clc,clear
data = importdata('data.txt');
x = data(:, 1);
y = data(:, 2);
tour1 = [1 4 2 3 5 9 19 6 7 8 18 17 20 15 16 14 11 13 12 10];

h = figure;
ax = axes('Parent', h);

hold on
for i = 1 : length(tour1) - 1
    xdata = [x(tour1(i)) x(tour1(i + 1))];
    ydata = [y(tour1(i)) y(tour1(i + 1))];
    plot(xdata, ydata, 'Color', 'r', 'LineWidth', 1.5)
end

xdata = [x(tour1(length(tour1))) x(tour1(1))];
ydata = [y(tour1(length(tour1))) y(tour1(1))];
plot(xdata, ydata, 'Color', 'r', 'LineWidth', 1.5)


scatter(x, y, 'b', 'filled');
ax.YAxis.Visible = 'off';
ax.XAxis.Visible = 'off';
hold off
saveas(h, 'figure/tourB.png')