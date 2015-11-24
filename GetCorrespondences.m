function [ xy1, xy2] = GetCorrespondences( img1, img2, numPoints )


SideBySide( img1, img2 );


%Plot points on first image
p1 = '.m';
GrayOut( 'right', numPoints, img1,img2 );
[x1, y1] = Plotter( p1, numPoints );
sz = size(x1,2);
xy1 = [x1; y1; ones(1,sz)];

%Plot points on second image
p2 = '.b';
GrayOut( 'left', numPoints, img1,img2, [x1; y1], p1 );
[x2, y2] = Plotter( p2, numPoints );
sz = size(x2,2);
xy2 = [x2; y2; ones(1,sz)];


GrayOut( 'revert', 0, img1,img2, [x1; y1], p1,  [x2; y2], p2 );

end