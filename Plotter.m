function [ X , Y ] = Plotter( plotType )

    X = zeros(1,4);
    Y = zeros(1,4);

    for i=1:4
        [ xPt, yPt ] = ginput(1);
        hold on
        plot( xPt,yPt, plotType );
        X(1,i) = xPt;
        Y(1,i) = yPt;
    end
    
end