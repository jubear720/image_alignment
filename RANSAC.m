function H = RANSAC( p1, p2 )

    inliers_1 = [];
    inliers_2 = [];
    
while size(inliers_1) < 1
    [~,sz] = size(p1);
    estimations = 1000;
    dist_threshold = 2000;
    max_inlier = -100;
    min_std = 10000000000;
    p = 0.99;
    temp = zeros(1,sz);
    inliers_1 = [];
    inliers_2 = [];
    for i=1:estimations
        %Choose random correspondences
        [ pA, pB ] = GetRandomPoints( p1, p2 );

        %Compute H on the 4 points
        H_Temp = ComputeHomography( pA, pB );
        H_inv = inv(H_Temp);

        
        distances = [];

        for j=1:sz
            a = Distance(p2(:,j), H_Temp' * (p1(:,j)));
            b = Distance(p1(:,j), H_inv' * (p2(:,j)));
            distances(j) = a + b;
        end

        STD = std(distances);

        if STD < min_std
            min_std = STD;
        end

        numInliers = 0;
        good_inliers_1 = [];
        good_inliers_2 = [];
        for j=1:4
            if distances(j) < dist_threshold
                numInliers = numInliers + 1;
                good_inliers_1 = [inliers_1; pA(:,j)];
                good_inliers_2 = [inliers_2; pB(:,j)];
            end
        end

        if numInliers > max_inlier || (numInliers == max_inlier && STD < min_std)
            inliers_1 = [inliers_1; good_inliers_1];
            inliers_2 = [inliers_2; good_inliers_2];
            max_inlier = numInliers;
        end

    end
end
    H = ComputeHomography( inliers_1, inliers_2 );

end
