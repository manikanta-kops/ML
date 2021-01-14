function [C, sigma] = dataset3Params(X, y, Xval, yval)
%DATASET3PARAMS returns your choice of C and sigma for Part 3 of the exercise
%where you select the optimal (C, sigma) learning parameters to use for SVM
%with RBF kernel
%   [C, sigma] = DATASET3PARAMS(X, y, Xval, yval) returns your choice of C and 
%   sigma. You should complete this function to return the optimal C and 
%   sigma based on a cross-validation set.
%

% You need to return the following variables correctly.
C = 2;
sigma = 0.3;

% ====================== YOUR CODE HERE ======================
% Instructions: Fill in this function to return the optimal C and sigma
%               learning parameters found using the cross validation set.
%               You can use svmPredict to predict the labels on the cross
%               validation set. For example, 
%                   predictions = svmPredict(model, Xval);
%               will return the predictions on the cross validation set.
%
%  Note: You can compute the prediction error using 
%        mean(double(predictions ~= yval))
%
% gaussianKernel


% c_test_values = [0.01, 0.03, 0.1, 0.3, 1, 3, 10, 30];
% sigma_test_values = [0.01, 0.03, 0.1, 0.3, 1, 3, 10, 30];
% error_values = [];
% C_S_values = [];

% for c_test = c_test_values,
%     for sigma_test = sigma_test_values,
%         model= svmTrain(X, y, c_test, @(x1, x2) gaussianKernel(x1, x2, sigma_test));
%         predictions = svmPredict(model, Xval);
%         current_error =  mean(double(predictions ~= yval));
%         error_values = [error_values;current_error];
%         current_c_s_values = ["C:" mat2str(c_test) "sigma:" mat2str(sigma_test)];
%         C_S_values = [C_S_values;current_c_s_values];
%         % fprintf('\nCross validation Set error on %f is %f\n', c_test,current_error);
%     end;
% end;

%  [min_error,indx] = min(error_values)

%  fprintf('\n Min error:%f at %s \n', min_error,C_S_values(indx,:));

%got the below values by running above code
C = 1;
sigma = 0.1;








% =========================================================================

end
