clc,clear
data = importdata('data.txt');
x = data(:, 1);
y = data(:, 2);
tours = [10 1; 13 12; 7 6; 19 9];
tourd = [1 2; 2 4; 4 12; 13 15; 15 20; 20 8; 8 7; 6 3; 3 5; 5 9; 19 18; 18 17; 17 16; 16 14; 14 11; 11 10];

h = figure;
ax = axes('Parent', h);

hold on

polts(x, y, tours)
poltd(x, y, tourd)

scatter(x, y, 'b', 'filled');
ax.YAxis.Visible = 'off';
ax.XAxis.Visible = 'off';
hold off
saveas(h, 'figure/validA.png')