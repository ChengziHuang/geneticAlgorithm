clc,clear
data = importdata('data.txt');
x = data(:, 1);
y = data(:, 2);
tours = [10 1; 2 3; 19 9; 19 6; 11 13; 16 15; 17 20; 18 8];
tourd = [10 12; 12 1; 2 4; 4 6;3 5; 5 9;13 7; 7 8;11 14; 14 16; 15 20; 17 18];

h = figure;
ax = axes('Parent', h);

hold on

polts(x, y, tours)
poltd(x, y, tourd)

scatter(x, y, 'b', 'filled');
ax.YAxis.Visible = 'off';
ax.XAxis.Visible = 'off';
hold off
saveas(h, 'figure/intermediateC.png')