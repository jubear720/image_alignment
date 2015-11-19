function [ alpha ] = ComputeScaleFactor( points, muX, muY )

    x = points(1,:);
    y = points(2,:);
    
    %n = number of points
    n = size(points,2);
    
    numerator = sqrt(2);
    denominator = 0;
    
    if n < 1
        %Error handling so that we don't divide by zero
        denominator = 1;
    else 
        for i=1:n
            denominator = denominator +  ...
                sqrt( ( x(i) - muX )^2 + ( y(i) - muY )^2 ); 
        end
    end
    
    denominator = ( 1 / n ) * denominator;
    alpha = numerator/denominator;

end