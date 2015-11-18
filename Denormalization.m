function H = Denormalization( H, T1, T2 )
%Denormalization
    H = inv(T2) * H * T1;
end