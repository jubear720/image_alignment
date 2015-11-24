function composite = Overlay( im1, im2, H )

    %Set pPrime and P
    pPrime = rgb2gray(im1);
    p      = rgb2gray(im2);
    
    im1 = im2double(im1);
    im2 = im2double(im2);
    
    %Inverse of Homography matrix
    Hinv = inv(H);

    %Get dimension info
    [pPrimeY, pPrimeX, ~] = size(pPrime);
    [pY,      pX,      ~] = size(p);

    %Get the bounding box
    [bbox, bounds] = BoundingBox( im1, im2, H );
    
    %Define mins and max points
    minX = bounds(1,1);
    maxX = bounds(2,1);
    minY = bounds(1,2);
    maxY = bounds(2,2);
    
    %put image that isn't going to be warped in it
    bbox(-minY+1:-minY+pY, -minX+1:-minX+pX, :) = im2;
    [ overlayH, overlayW ] = size(bbox);
    %loop across the black image that is the size of the composite
    for y=1:overlayH
        for x=1:overlayW

            %inverse warp the coordinate 
            p = H \ [minX + x; minY + y; 1];
            
            %normalize the point from inverse warping
            u = (p(1,1) / p(3,1));
            v = (p(2,1) / p(3,1));

            %check if the point is within the bounds of the non-warped
            %image
            if u < 1 || v < 1 || u > pPrimeX || v > pPrimeY
                continue
            end

            bbox(y,x,1) = Interpolation(im1, 1, u, v);
            bbox(y,x,2) = Interpolation(im1, 2, u, v);
            bbox(y,x,3) = Interpolation(im1, 3, u, v);

        end

    end

    composite = bbox;

end