clc,clear
data = importdata('data.txt');
x = data(:, 1);
y = data(:, 2);
tours = [17 20; 16 15; 12 13; 1 4; 7 6];
tourd = [16 17; 15 20; 13 7; 4 6; 12 1];

h = figure;
ax = axes('Parent', h);

hold on

polts(x, y, tours)
poltd(x, y, tourd)

scatter(x, y, 'b', 'filled');
ax.YAxis.Visible = 'off';
ax.XAxis.Visible = 'off';
hold off
saveas(h, 'figure/AB-cycleA.png')