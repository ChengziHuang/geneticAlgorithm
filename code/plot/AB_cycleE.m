clc,clear
data = importdata('data.txt');
x = data(:, 1);
y = data(:, 2);

h = figure;
ax = axes('Parent', h);
hold on
%% 14-16
arc = [3.25 4.15 ;data(14, 1), data(14, 2); data(16, 1), data(16, 2)];
x1 = data(14, 1) : 0.001 : data(16, 1);
y1 = interp1(arc(:, 1 )', arc(:, 2)', x1, 'PCHIP');
plot(x1, y1,'Color', 'r', 'LineWidth', 1.5)

arc = [1.3 3.1 ;data(14, 1), data(14, 2); data(16, 1), data(16, 2)];
x1 = data(14, 1) : 0.001 : data(16, 1);
y1 = interp1(arc(:, 1 )', arc(:, 2)', x1, 'PCHIP');
plot(x1, y1,'--','Color', 'r', 'LineWidth', 1.5)

%% 7-8
arc = [3.25 4.6 ;data(7, 1), data(7, 2); data(8, 1), data(8, 2)];
x1 = data(7, 1) : 0.001 : data(8, 1);
y1 = interp1(arc(:, 1 )', arc(:, 2)', x1, 'PCHIP');
plot(x1, y1,'Color', 'r', 'LineWidth', 1.5)

arc = [1 0.05 ;data(7, 1), data(7, 2); data(8, 1), data(8, 2)];
x1 = data(7, 1) : 0.001 : data(8, 1);
y1 = interp1(arc(:, 1 )', arc(:, 2)', x1, 'PCHIP');
plot(x1, y1,'--','Color', 'r', 'LineWidth', 1.5)


%% 10-12
arc = [1500000000 0.00002 ;data(2, 1), data(2, 2); data(4, 1), data(4, 2)];
x1 = data(2, 1) : 0.001 : data(4, 1);
y1 = interp1(arc(:, 1 )', arc(:, 2)', x1, 'PCHIP');
plot(x1, y1,'Color', 'r', 'LineWidth', 1.5)

arc = [-15 600000000000 ;data(2, 1), data(2, 2); data(4, 1), data(4, 2)];
x1 = data(2, 1) : 0.001 : data(4, 1);
y1 = interp1(arc(:, 1 )', arc(:, 2)', x1, 'PCHIP');
plot(x1, y1,'--','Color', 'r', 'LineWidth', 1.5)

% %% 3-5
arc = [1.5 0.001 ;data(5, 1), data(5, 2); data(9, 1), data(9, 2)];
x1 = data(5, 1) : -0.001 : data(9, 1);
y1 = interp1(arc(:, 1 )', arc(:, 2)', x1, 'PCHIP');
plot(x1, y1,'Color', 'r', 'LineWidth', 1.5)

arc = [6.25 1.25 ;data(5, 1), data(5, 2); data(9, 1), data(9, 2)];
x1 = data(5, 1) : -0.001 : data(9, 1);
y1 = interp1(arc(:, 1 )', arc(:, 2)', x1, 'PCHIP');
plot(x1, y1,'--','Color', 'r', 'LineWidth', 1.5)

scatter(x, y, 'b', 'filled');
ax.YAxis.Visible = 'off';
ax.XAxis.Visible = 'off';
hold off
saveas(h, 'AB-cycleE.png')