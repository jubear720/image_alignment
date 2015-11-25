function T = Normalization( points )
%Normalization Normalize the points
%%% Julian Anthony Brackins   %%%
%%% CSC 514 - Computer Vision %%%
%%% Project 2                 %%%
    %Compute mean of your points
    [ muX, muY ] = ComputeMean( points );
    
    %Compute the scale factor such that avg distance of each point is
    %sqrt(2) from the origin
    alpha = ComputeScaleFactor( points, muX, muY );

    T = [ alpha   0   -alpha*muX ;
            0   alpha -alpha*muY ;
            0     0        1    ];
end