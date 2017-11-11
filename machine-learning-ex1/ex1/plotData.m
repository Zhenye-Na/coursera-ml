function plotData(x, y)

figure; % open a new figure window

data = load('ex1data1.txt'); 
x = data(:, 1); 
y = data(:, 2); 
m = length(y);
plot(x, y, 'rx', 'MarkerSize', 10); 
ylabel('Profit in $10,000s'); 
xlabel('Population of City in 10,000s');



% ============================================================

end
