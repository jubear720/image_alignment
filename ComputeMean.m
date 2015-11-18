function [ muX, muY ] = ComputeMean( points )

    x = points(1,:);
    y = points(2,:);
    
    muX = mean(x);
    muY = mean(y);

end