clc,clear
data = importdata('data.txt');
x = data(:, 1);
y = data(:, 2);
tours = [11 13;15 20; 19 6; 2 3; 1 10];
tourd = [10 11; 13 15; 20 19; 6 3; 1 2];

h = figure;
ax = axes('Parent', h);

hold on

polts(x, y, tours)
poltd(x, y, tourd)

scatter(x, y, 'b', 'filled');
ax.YAxis.Visible = 'off';
ax.XAxis.Visible = 'off';
hold off
saveas(h, 'figure/AB-cycleC.png')