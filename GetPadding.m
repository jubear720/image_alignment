function [ xPad, yPad, X, Y ] = GetPadding( I1, I2, H )

    [h1, w1, d1] = size(I1);
    C1 = [   0 0 w1 w1;
             0 h1 0 h1;
             1 1 1 1];
         
     [h2, w2, d2] = size(I2);
     C2 = [   0 0 w2 w2;
              0 h2 0 h2;
              1 1 1  1];
    C2 = inv(H) * C2;
    
    for i=1:4
        sc = 1/C2(3,i);
        C2(:,i) = C2(:,i) * sc;
    end
    C2 = C2';
    

    % Determine outer boundary of newimage 1
maxBoundX=max(C2(:,1));
minBoundX=min(C2(:,1));
maxBoundY=max(C2(:,2));
minBoundY=min(C2(:,2));

    minY = min([minBoundX h1 1]);
    maxY = max([maxBoundX h1]);
    minX = min([minBoundY 1 w1]);
    maxX = max([maxBoundY w1]);
    
    X = [ minX; maxX ];
    Y = [ minY; maxY ];
    CompositeW = abs(maxX - minX);
    CompositeH = abs(maxY - minY);
    
    xPad = CompositeW;
    yPad = CompositeH;
end