function [C, sigma] = dataset3Params(X, y, Xval, yval)
%DATASET3PARAMS returns your choice of C and sigma for Part 3 of the exercise
%where you select the optimal (C, sigma) learning parameters to use for SVM
%with RBF kernel
%   [C, sigma] = DATASET3PARAMS(X, y, Xval, yval) returns your choice of C and 
%   sigma. You should complete this function to return the optimal C and 
%   sigma based on a cross-validation set.
%

% You need to return the following variables correctly.
C = 1;
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


% raw data
predictions = zeros(size(yval,1),1);
validation_error = 99999;

for i_C = [0.01 0.03 0.1 0.3 1 3 10 30]
	for j_sigma = [0.01 0.03 0.1 0.3 1 3 10 30]		

		% train the SVM model
		model= svmTrain(X, y, i_C, @(x1, x2) gaussianKernel(x1, x2, j_sigma)); 

		% predict on the validation set
		predictions = svmPredict(model, Xval);

		% define the validation error
		validation_error_iterarion = mean(double(predictions ~= yval));

		% if the iteration of validation_error_iterarion is smaller, then change the value of validation_error
		if validation_error_iterarion < validation_error
			C = i_C;
			sigma = j_sigma;
			validation_error = validation_error_iterarion;
		end
	end
end



% =========================================================================

end
