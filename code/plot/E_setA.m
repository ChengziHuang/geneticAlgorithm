clc,clear
data = importdata('data.txt');
x = data(:, 1);
y = data(:, 2);
tours = [13 12; 1 4; 6 7];
tourd = [12 1; 4 6; 13 7];

h = figure;
ax = axes('Parent', h);

hold on

polts(x, y, tours)
poltd(x, y, tourd)

scatter(x, y, 'b', 'filled');
ax.YAxis.Visible = 'off';
ax.XAxis.Visible = 'off';
hold off
saveas(h, 'figure/E-setA.png')