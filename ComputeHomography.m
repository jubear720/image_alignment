function H = ComputeHomography( p1, p2 )
%BoundingBox H matrix to determine image transformation
%%% Julian Anthony Brackins   %%%
%%% CSC 514 - Computer Vision %%%
%%% Project 2                 %%%
%Second step of Part 1


    %compute similarity transformations
    %T1 = Normalization( p1 );
    %T2 = Normalization( p2 );

    %Normalize Points using T matrices
    %p1Norm = p1;%T1*p1;
    %p2Norm = p2;%T2*p2;

    %Perform Direct Linear Transformation
    H = DLT( p1, p2 );

    %Denormalize The H matrix
    %H = Denormalization(H, T1, T2);


end