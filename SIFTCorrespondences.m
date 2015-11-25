function [ xy1, xy2] = SIFTCorrespondences( file1, file2 )
%SIFTCorrespondences modified adaptation of Dr. Lowe's SIFT program
%%% Julian Anthony Brackins   %%%
%%% CSC 514 - Computer Vision %%%
%%% Project 2                 %%%

fprintf('Automatically Computing Correspondences\n');

% Find SIFT keypoints for each image
[im1, des1, loc1] = sift(file1);
[im2, des2, loc2] = sift(file2);

 xy1 = [];
 xy2 = [];
match = [];
% For efficiency in Matlab, it is cheaper to compute dot products between
%  unit vectors rather than Euclidean distances.  Note that the ratio of 
%  angles (acos of dot products of unit vectors) is a close approximation
%  to the ratio of Euclidean distances for small angles.
%
% distRatio: Only keep matches in which the ratio of vector angles from the
%   nearest to second nearest neighbor is less than distRatio.
distRatio = 0.6;   

% For each descriptor in the first image, select its match to second image.
des2t = des2';                          % Precompute matrix transpose
for i = 1 : size(des1,1)
   dotprods = des1(i,:) * des2t;        % Computes vector of dot products
   [vals,indx] = sort(acos(dotprods));  % Take inverse cosine and sort results

   % Check if nearest neighbor has angle less than distRatio times 2nd.
   if (vals(1) < distRatio * vals(2))
      match(i) = indx(1);
   else
      match(i) = 0;
   end
end

% Create a new image showing the two images side by side.
im3 = appendimages(im1,im2);

% Show a figure with lines joining the accepted matches.
figure('Position', [100 100 size(im3,2) size(im3,1)]);
colormap('gray');
imagesc(im3);
hold on;
cols1 = size(im1,2);
for i = 1: size(des1,1)
  if (match(i) > 0)
    line([loc1(i,2) loc2(match(i),2)+cols1], ...
        [loc1(i,1) loc2(match(i),1)], 'Color', 'c');
    pts2 = [ loc1(i,2); loc1(i,1); 1 ];
    pts1 = [ loc2(match(i),2); loc2(match(i),1); 1 ];
    xy1 = [ xy1 pts1 ];
    xy2 = [ xy2 pts2 ];
  end
end
%hold off;
num = sum(match > 0);
fprintf('Found %d matches.\n', num);

end