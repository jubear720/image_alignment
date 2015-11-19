function [ xPad, yPad ] = GetPadding( I1, I2, H )

    [h1, w1, d1] = size(I1);
    C1 = [   0 0 w1 w1;
             0 h1 0 h1;
             1 1 1 1]
         
     [h2, w2, d2] = size(I2);
     C2 = [   0 0 w2 w2;
              0 h2 0 h2;
              1 1 1  1]
    C2 = H * C2;
    
    for i=1:4
        C2(:,i) = C2(:,i) / C2(3,i)
    end
    
    Composite = [ C2 C1 ]
    
    minX = floor ( min( Composite(1,:)) )
    maxX = floor ( max( Composite(1,:)) )
    minY = floor ( min( Composite(2,:)) )
    maxY = floor ( max( Composite(2,:)) )
    
    CompositeW = abs(maxX - minX)
    CompositeH = abs(maxY - minY)
    
    xPad = CompositeW;
    yPad = CompositeH;
end