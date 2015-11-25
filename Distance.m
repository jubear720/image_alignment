function dist = Distance( p1, p2 )
%Distance Calculate the Euclidean Distance between two point sets
%%% Julian Anthony Brackins   %%%
%%% CSC 514 - Computer Vision %%%
%%% Project 2                 %%%

    p2 = p2./p2(3,1);
    x1 = p1(1,1);
    y1 = p1(2,1);
    x2 = p2(1,1);
    y2 = p2(2,1);
    
    dist = sqrt( (x2-x1)^2 + (y2-y1)^2 );
end