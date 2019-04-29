clc,clear
data = importdata('data.txt');
x = data(:, 1);
y = data(:, 2);
tours = [16 15; 17 20; 19 9; 8 18];
tourd = [14 16; 14 11; 11 10; 10 12; 12 1; 1 2; 2 4; 4 6; 6 3; 3 5; 5 9; 19 20; 17 18; 8 7; 7 13;13 15];

h = figure;
ax = axes('Parent', h);

hold on

polts(x, y, tours)
poltd(x, y, tourd)

scatter(x, y, 'b', 'filled');
ax.YAxis.Visible = 'off';
ax.XAxis.Visible = 'off';
hold off
saveas(h, 'figure/intermediateB.png')