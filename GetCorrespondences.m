function [ xy1, xy2] = GetCorrespondences( file1, file2 )

files = [file1; file2];

SideBySide( file1, file2 );

numPoints = GetPointCountQuery();

%Plot points on first image
p1 = '.m';
GrayOut( 'right', numPoints, files );
[x1, y1] = Plotter( p1, numPoints );
xy1 = [x1, y1];

%Plot points on second image
p2 = '.b';
GrayOut( 'left', numPoints, files, [x1; y1], p1 );
[x2, y2] = Plotter( p2, numPoints );
xy2 = [x2, y2];


GrayOut( 'revert', 0, files, [x1; y1], p1,  [x2; y2], p2 );

end