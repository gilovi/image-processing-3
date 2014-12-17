function img = LaplacianToImage(lpyr, filter, coeffMultVec)
%LaplacianToImage reconstructs an image from a laplacian pyramid

img = lpyr{end}*;
for i = length(lpyr)-1:-1:1;
img = expand(lpyr{i},2,filter) + lpyr{i};



end
