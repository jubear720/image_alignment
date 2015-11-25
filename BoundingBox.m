function [box, bounds] = BoundingBox( i1, i2, H )
%BoundingBox Compute Bounding Box that defines entire area that fits both
%images
%%% Julian Anthony Brackins   %%%
%%% CSC 514 - Computer Vision %%%
%%% Project 2                 %%%

    %Set pPrime and p
    pPrime = rgb2gray(i1);
    p = rgb2gray(i2);
    
    [pPrimeY, pPrimeX, ~] = size(pPrime);
    [pY, pX, ~] = size(p);

    %Compute Corners of image
    C = [H * [0      ;0      ;1], ...
         H * [pPrimeX;0      ;1], ...
         H * [pPrimeX;pPrimeY;1], ...
         H * [0      ;pPrimeY;1]]';

    C = [  C; ...
           0  0  1; ...
           pX 0  1; ...
           pX pY 1; ...
           0  pY 1];
           
   %Normalize the values
    for i=1:4
        C(i,1) = C(i,1)/C(i,3);
        C(i,2) = C(i,2)/C(i,3);
        C(i,3) = C(i,3)/C(i,3);
    end

    %Get Maximum values with ceil
    maxX = ceil(max(C(:,1)));
    maxY = ceil(max(C(:,2)));
    
    %Get Minimum values with floor
    minX = floor(min(C(:,1)));
    minY = floor(min(C(:,2)));
    
    %Generate the overlay values
    overW = maxX-minX;
    overH = maxY-minY;

    %create the boundingg box
    box = zeros(overH, overW, 3);
    
    %Return struct containing min and maxes
    bounds = [ minX minY ;
               maxX maxY];

end