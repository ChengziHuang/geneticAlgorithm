clc,clear
TOL = 0.0004;
ITER = 30;
kappa = 4;

X = [1000*randn(1000,2) + 1000; 2000*randn(1000,2) + 5000];
    
[C, I, iter] = kmeans(X, kappa, ITER, TOL);

disp(['k-means instance took ' int2str(iter) ' iterations to complete']);

colors = {'red', 'green', 'blue', 'black'};
    
shape = {'o', '+', 's', 'h'};
% show plot of clustering
hold on;
for i=1:kappa 
    plot(X(I == i, 1), X(I == i, 2), shape{i} , 'color', colors{i});
end
