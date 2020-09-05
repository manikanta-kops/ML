%% Initialization

%% ================ Part 1: Feature Normalization ================

%% Clear and Close Figures
clear ; close all; clc

fprintf('Loading data ...\n');

%% Load Data
data = load('data_set2.txt');
X = data(:, 1:2); % features
y = data(:, 3); % values
m = length(y); % no.of training examples

% Print out some data points
fprintf('First 10 examples from the dataset: \n');
fprintf(' x = [%.0f %.0f], y = %.0f \n', [X(1:10,:) y(1:10,:)]');

fprintf('Program paused. Press enter to continue.\n');
pause;

% Scale features and set them to zero mean
fprintf('Normalizing Features ...\n');

[X mu sigma] = featureNormalize(X);

% Add intercept term to X
X = [ones(m, 1) X];


%% ================ Part 2: Gradient Descent ================


fprintf('Running gradient descent ...\n');

% Choose some alpha value
alpha = input ("Pick a number, for the alpha value like (0.1): ",'%i');

num_iters = input ("Pick a number, for no.of iterations like (50): ",'%i');
alpha =str2num(alpha);
num_iters =str2num(num_iters);
typeinfo (alpha)
typeinfo(num_iters)

% Init Theta and Run Gradient Descent 
theta = zeros(3, 1);
[theta, J_history] = gradientDescent(X, y, theta, alpha, num_iters);

% Plot the convergence graph
figure;
plot(1:numel(J_history), J_history, '-b', 'LineWidth', 2);
xlabel('Number of iterations');
ylabel('Cost J');

% Display gradient descent's result
fprintf('Theta computed from gradient descent: \n');
fprintf(' %f \n', theta);
fprintf('\n');

% Estimate the price of a 1650 sq-ft, 3 br house
% ====================== YOUR CODE HERE ======================
% Recall that the first column of X is all-ones. Thus, it does
% not need to be normalized.
price = 0; % You should change this

% for some sample row 3, the value should be around 369000
predict1 = [1,0.50247636  -0.22367519] *theta;
% ============================================================

fprintf(['Predicted price of a 2400 sq-ft, 3 br house should be around  369000' ...
         '(using gradient descent):\n $%f\n'], predict1);

fprintf('Program paused. Press enter to continue.\n');
pause;

%% ================ Part 3: Normal Equations ================

fprintf('Solving with normal equations...\n');

% ====================== YOUR CODE HERE ======================
% Instructions: The following code computes the closed form 
%               solution for linear regression using the normal
%               equations. You should complete the code in 
%               normalEqn.m
%
%               After doing so, you should complete this code 
%               to predict the price of a 1650 sq-ft, 3 br house.
%

%% Load Data
data = csvread('data_set2.txt');
X = data(:, 1:2);
y = data(:, 3);
m = length(y);

% Add intercept term to X
X = [ones(m, 1) X];

% Calculate the parameters from the normal equation
theta = normalEqn(X, y);
predict1 = [1, 2400,3] *theta;
% Display normal equation's result
fprintf('Theta computed from the normal equations: \n');
fprintf(' %f \n', theta);
fprintf('\n');
fprintf(['Predicted price of a 2400 sq-ft, 3 br house should be around  369000' ...
         '(using normal Equation):\n $%f\n'], predict1);




