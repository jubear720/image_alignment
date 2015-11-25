function HDenorm = Denormalization( H, T1, T2 )
%Denormalization Denormalize the H matrix
%%% Julian Anthony Brackins   %%%
%%% CSC 514 - Computer Vision %%%
%%% Project 2                 %%%

%Denormalization
    temp = T2/H;
    HDenorm = temp*T1;
end