function [ X , Y ] = Plotter( plotType, NumberOfPoints )
%Plotter Plot the clicked points on an image canvas
%%% Julian Anthony Brackins   %%%
%%% CSC 514 - Computer Vision %%%
%%% Project 2                 %%%

    X = zeros(1,NumberOfPoints);
    Y = zeros(1,NumberOfPoints);

    for i=1:NumberOfPoints
        [ xPt, yPt ] = ginput(1);
        hold on
        plot( xPt,yPt, plotType);
        X(1,i) = xPt;
        Y(1,i) = yPt;
    end
    
end