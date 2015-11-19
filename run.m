clc
close all

%[ File1, File2 ] = GetFileQuery();
File1 = 'img\Yosemite\Yosemite2.jpg';
File2 = 'img\Yosemite\Yosemite1.jpg';

%Points = GetPointCountQuery();
Points = 4
%Getting Correspondences
%Matlab code to manually identify corresponding points from two views.
[p1, p2] =  GetCorrespondences( File1, File2, Points )
%[p1, p2] = FakeCorrespondences( File1, File2 );

H = ComputeHomography( p1, p2 );
fH = ComputeHomography( p1, p1 );


I1 = im2double(imread(File1));
I2 = im2double(imread(File2));
H;

[ padX, padY ] = GetPadding(I1, I2, H);
Padding = [ padX, padY ];

WarpedI1 = WarpImage( I1, fH, Padding );


WarpedI2 = WarpImage( I2, H, Padding );

%ShowImage( WarpedI2, 'warped image');

CreateMosaic( WarpedI1, WarpedI2 );