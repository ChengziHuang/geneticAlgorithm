clc,clear
data = importdata('data.txt');
x = data(:, 1);
y = data(:, 2);
tours = [17 20; 16 15; 11 13; 10 1; 2 3; 19 9];
tourd = [17 18; 18 19; 9 5; 5 3; 2 1; 10 12;12 4; 4 6; 6 8; 8 7; 7 13; 11 14; 14 16; 15 20];

h = figure;
ax = axes('Parent', h);

hold on

polts(x, y, tours)
poltd(x, y, tourd)

scatter(x, y, 'b', 'filled');
ax.YAxis.Visible = 'off';
ax.XAxis.Visible = 'off';
hold off
saveas(h, 'figure/validC.png')