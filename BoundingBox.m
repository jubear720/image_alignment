function box = BoundingBox( Image, H )

%: (1,1), (w,1), (1,h), and (w,h)

    [ y, x ] = size(Image);
    boxTopLeft     = [ 1; 1 ];
    boxTopRight    = [ x; 1 ];
    boxBottomLeft  = [ 1; y ];
    boxBottomRight = [ x; y ];

    box = [ boxTopLeft boxTopRight boxBottomLeft boxBottomRight];
end