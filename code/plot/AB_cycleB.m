clc,clear
data = importdata('data.txt');
x = data(:, 1);
y = data(:, 2);
tours = [18 8; 19 9];
tourd = [18 19; 8 9];

h = figure;
ax = axes('Parent', h);

hold on

polts(x, y, tours)
poltd(x, y, tourd)

scatter(x, y, 'b', 'filled');
ax.YAxis.Visible = 'off';
ax.XAxis.Visible = 'off';
hold off
saveas(h, 'figure/AB-cycleB.png')