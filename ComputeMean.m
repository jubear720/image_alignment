function [ muX, muY ] = ComputeMean( points )
%ComputeMean Compute the Mean of some data set
%%% Julian Anthony Brackins   %%%
%%% CSC 514 - Computer Vision %%%
%%% Project 2                 %%%

    x = points(1,:);
    y = points(2,:);
    
    muX = mean(x);
    muY = mean(y);

end