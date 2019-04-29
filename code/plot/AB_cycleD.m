clc,clear
data = importdata('data.txt');
x = data(:, 1);
y = data(:, 2);

h = figure;
ax = axes('Parent', h);
hold on
%% 11-14
arc = [3.25 4.15 ;data(11, 1), data(11, 2); data(14, 1), data(14, 2)];
x1 = data(11, 1) : -0.001 : data(14, 1);
y1 = interp1(arc(:, 1 )', arc(:, 2)', x1, 'PCHIP');
plot(x1, y1,'Color', 'r', 'LineWidth', 1.5)

arc = [1.3 2.5 ;data(11, 1), data(11, 2); data(14, 1), data(14, 2)];
x1 = data(11, 1) : -0.001 : data(14, 1);
y1 = interp1(arc(:, 1 )', arc(:, 2)', x1, 'PCHIP');
plot(x1, y1,'--','Color', 'r', 'LineWidth', 1.5)

%% 17-18
arc = [3.25 4.6 ;data(17, 1), data(17, 2); data(18, 1), data(18, 2)];
x1 = data(17, 1) : 0.001 : data(18, 1);
y1 = interp1(arc(:, 1 )', arc(:, 2)', x1, 'PCHIP');
plot(x1, y1,'Color', 'r', 'LineWidth', 1.5)

arc = [1.3 2.5 ;data(17, 1), data(17, 2); data(18, 1), data(18, 2)];
x1 = data(17, 1) : 0.001 : data(18, 1);
y1 = interp1(arc(:, 1 )', arc(:, 2)', x1, 'PCHIP');
plot(x1, y1,'--','Color', 'r', 'LineWidth', 1.5)


%% 10-12
arc = [1.5 1.2 ;data(10, 1), data(10, 2); data(12, 1), data(12, 2)];
x1 = data(10, 1) : 0.001 : data(12, 1);
y1 = interp1(arc(:, 1 )', arc(:, 2)', x1, 'PCHIP');
plot(x1, y1,'Color', 'r', 'LineWidth', 1.5)

arc = [1.5 1.8 ;data(10, 1), data(10, 2); data(12, 1), data(12, 2)];
x1 = data(10, 1) : 0.001 : data(12, 1);
y1 = interp1(arc(:, 1 )', arc(:, 2)', x1, 'PCHIP');
plot(x1, y1,'--','Color', 'r', 'LineWidth', 1.5)

%% 3-5
arc = [1.5 0.001 ;data(3, 1), data(3, 2); data(5, 1), data(5, 2)];
x1 = data(3, 1) : 0.001 : data(5, 1);
y1 = interp1(arc(:, 1 )', arc(:, 2)', x1, 'PCHIP');
plot(x1, y1,'Color', 'r', 'LineWidth', 1.5)

arc = [1.5 3 ;data(3, 1), data(3, 2); data(5, 1), data(5, 2)];
x1 = data(3, 1) : 0.001 : data(5, 1);
y1 = interp1(arc(:, 1 )', arc(:, 2)', x1, 'PCHIP');
plot(x1, y1,'--','Color', 'r', 'LineWidth', 1.5)

scatter(x, y, 'b', 'filled');
ax.YAxis.Visible = 'off';
ax.XAxis.Visible = 'off';
hold off
saveas(h, 'figure/AB-cycleD.png')