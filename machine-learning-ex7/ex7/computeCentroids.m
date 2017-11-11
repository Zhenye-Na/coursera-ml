function centroids = computeCentroids(X, idx, K)
%COMPUTECENTROIDS returns the new centroids by computing the means of the 
%data points assigned to each centroid.
%   centroids = COMPUTECENTROIDS(X, idx, K) returns the new centroids by 
%   computing the means of the data points assigned to each centroid. It is
%   given a dataset X where each row is a single data point, a vector
%   idx of centroid assignments (i.e. each entry in range [1..K]) for each
%   example, and K, the number of centroids. You should return a matrix
%   centroids, where each row of centroids is the mean of the data points
%   assigned to it.
%

% Useful variables
[m n] = size(X);

% You need to return the following variables correctly.
centroids = zeros(K, n);


% ====================== YOUR CODE HERE ======================
% Instructions: Go over every centroid and compute mean of all points that
%               belong to it. Concretely, the row vector centroids(i, :)
%               should contain the mean of the data points assigned to
%               centroid i.
%
% Note: You can use a for-loop over the centroids to compute this.
%

% iterate through all the centroids
for i = 1:K
	% generate the indicator vector which implies which cluster X(i) belongs to
	indicator_v = double(idx == i);
	% regenerate the indicator vector to matrix which is easier for vectoralization
	centroids_index = repmat(indicator_v, 1, n);
	% compute the new centroids
	centroids_posiontion = centroids_index' * X ./ sum(centroids_index);
	% assign the value the centroids(i, :) with the first row of centroids_position
	centroids(i, :) = centroids_posiontion(1, :);
end




% =============================================================


end

