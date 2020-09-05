function [J, grad] = costFunctionReg(theta, X, y, lambda)
%COSTFUNCTIONREG Compute cost and gradient for logistic regression with regularization
%   J = COSTFUNCTIONREG(theta, X, y, lambda) computes the cost of using
%   theta as the parameter for regularized logistic regression and the
%   gradient of the cost w.r.t. to the parameters. 

% Initialize some useful values
m = length(y); % number of training examples

% You need to return the following variables correctly 
J = 0;
grad = zeros(size(theta));

% ====================== YOUR CODE HERE ======================
% Instructions: Compute the cost of a particular choice of theta.
%               You should set J to the cost.
%               Compute the partial derivatives and set grad to the partial
%               derivatives of the cost w.r.t. each parameter in theta

z = X*theta;
hypothesis = sigmoid(z);


for i=1:m
    J = J + ((y(i)*log(hypothesis(i))) + ((1 - y(i)) * log(1 - hypothesis(i))));
end;

reg_value = 0;
for j=2:size(X,2)
    reg_value = reg_value + theta(j)^2;
end;
reg_value = (lambda/(2*m))*reg_value;



J = ((-1/m) * J) + reg_value;


for j=1:size(X,2)
    currentGrad = 0;
    for i=1:m
        currentGrad = currentGrad + ((hypothesis(i) - y(i)) * X(i,j));
    end;
    if j == 1
        grad(j) = currentGrad/m;
    else
        grad(j) = (currentGrad/m) + ((lambda/m) * theta(j));
end;




% =============================================================

end
