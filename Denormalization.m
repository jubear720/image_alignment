function HDenorm = Denormalization( H, T1, T2 )
%Denormalization
    temp = T2/H;
    HDenorm = temp*T1;
end