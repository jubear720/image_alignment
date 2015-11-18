function H = ComputeHomography( p1, p2 )
%ComputeHomography 
%Second step of Part 1

    %compute similarity transformations
    T1 = Normalization( p1 );
    T2 = Normalization( p2 );

    %Normalize Points using T matrices
    p1Norm = T1*p1;
    p2Norm = T2*p2;

    %Perform Direct Linear Transformation
    H = DLT( p1Norm, p2Norm );

    %Denormalize The H matrix
    H = Denormalization(H, T1, T2);


end