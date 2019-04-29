clc,clear
data = importdata('data.txt');
x = data(:, 1);
y = data(:, 2);
tours = [13 12; 1 4; 7 6];
tourd = [1 2; 2 4; 3 5; 5 9; 8 9; 8 7; 6 3; 12 10; 10 11; 11 14; 14 16; 16 17; 17 18; 18 19; 19 20;20 15; 15 13];

h = figure;
ax = axes('Parent', h);

hold on

polts(x, y, tours)
poltd(x, y, tourd)

scatter(x, y, 'b', 'filled');
ax.YAxis.Visible = 'off';
ax.XAxis.Visible = 'off';
hold off
saveas(h, 'figure/intermediateA.png')