function pixVal = Interpolation( img, chan, x, y )
%Interpolation Linear Interpolation method
%%% Julian Anthony Brackins   %%%
%%% CSC 514 - Computer Vision %%%
%%% Project 2                 %%%
    xFrac = mod(x,1);
    yFrac = mod(y,1);

    Q11 = img(floor(y),   floor(x),   chan);
    Q12 = img(floor(y+1), floor(x),   chan);
    Q21 = img(floor(y),   floor(x+1), chan);
    Q22 = img(floor(y+1), floor(x+1), chan);

    pixVal = Q11 * (1-xFrac) * (1-yFrac) + ...
             Q21 * xFrac * (1-yFrac) + ...
             Q12 * (1-xFrac) * yFrac + ...
             Q22 * xFrac * yFrac;

end