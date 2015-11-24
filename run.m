clc
close all

%[ File1, File2 ] = GetFileQuery();
File1 = 'img\Yosemite\Yosemite1.jpg';
File2 = 'img\Yosemite\Yosemite2.jpg';
%File1 = 'img\DP_3\DSC_0198.JPG';
%File2 = 'img\DP_3\DSC_0196.JPG';

Image1 = im2double(imread(File1));
Image2 = im2double(imread(File2));
%Points = GetPointCountQuery();
Points = 4;
%Getting Correspondences
%Matlab code to manually identify corresponding points from two views.
%[p1, p2] =  GetCorrespondences( Image1, Image2, Points );
%close all

%[p1, p2] = FakeCorrespondences();
[ p1, p2] = SIFTCorrespondences( File2, File1 );
H = RANSAC( p1, p2 );
%H = ComputeHomography( p1, p2 );

Image3 = Overlay( Image1, Image2, H );

figure;
imshow(Image3);