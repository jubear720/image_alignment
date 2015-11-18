function [ X , Y ] = Plotter( plotType, NumberOfPoints )

    X = zeros(1,NumberOfPoints);
    Y = zeros(1,NumberOfPoints);

    for i=1:NumberOfPoints
        [ xPt, yPt ] = ginput(1);
        hold on
        plot( xPt,yPt, plotType );
        X(1,i) = xPt;
        Y(1,i) = yPt;
    end
    
end