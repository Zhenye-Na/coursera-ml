function idx = findClosestCentroids(X, centroids)
%FINDCLOSESTCENTROIDS computes the centroid memberships for every example
%   idx = FINDCLOSESTCENTROIDS (X, centroids) returns the closest centroids
%   in idx for a dataset X where each row is a single example. idx = m x 1 
%   vector of centroid assignments (i.e. each entry in range [1..K])
%

% Set K
K = size(centroids, 1);

% You need to return the following variables correctly.
idx = zeros(size(X,1), 1);

% ====================== YOUR CODE HERE ======================
% Instructions: Go over every example, find its closest centroid, and store
%               the index inside idx at the appropriate location.
%               Concretely, idx(i) should contain the index of the centroid
%               closest to example i. Hence, it should be a value in the 
%               range 1..K
%
% Note: You can use a for-loop over the examples to compute this.
%

% initialize distance matrix
d = zeros(size(centroids, 1), 2);

% iterate through all the input data
for i = 1:length(idx)
	% iterate through all the centroids
	for j = 1:K
		d(j, :) = [j sqrt((X(i, :) - centroids(j, :)) * (X(i, :) - centroids(j, :))')];
	end
	% find the minimal distance
	sorted_distance = sortrows(d, 2);
	% assign the index to idx(i)
	idx(i) = sorted_distance(1, 1);
end




% =============================================================

end

