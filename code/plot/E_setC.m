clc,clear
data = importdata('data.txt');
x = data(:, 1);
y = data(:, 2);
tour1 = [9 19; 8 18;6 19;2 3;10 1; 11 13; 15 16; 20 17];
tour2 = [1 2; 3 6; 8 9; 18 19; 11 10; 13 15; 16 17; 19 20];

h = figure;
ax = axes('Parent', h);
hold on

polts(x, y, tour1);

poltd(x, y, tour2);



arc = [3.25 4.15 ;data(15, 1), data(15, 2); data(20, 1), data(20, 2)];
x1 = data(15, 1) : 0.001 : data(20, 1);
y1 = interp1(arc(:, 1 )', arc(:, 2)', x1, 'PCHIP');
plot(x1, y1,'Color', 'r', 'LineWidth', 1.5)

arc = [3.3 4 ;data(15, 1), data(15, 2); data(20, 1), data(20, 2)];
x1 = data(15, 1) : 0.001 : data(20, 1);
y1 = interp1(arc(:, 1 )', arc(:, 2)', x1, 'PCHIP');
plot(x1, y1, '--', 'Color', 'r', 'LineWidth', 1.5)

scatter(x, y, 'b', 'filled');
ax.YAxis.Visible = 'off';
ax.XAxis.Visible = 'off';
hold off
saveas(h, 'figure/E-setC.png')