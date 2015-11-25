function CreateMosaic( Img1, Img2, Padding2 )
%CreateMosaic Stitch the two images together after using Warpimage. As
%discussed in the writeup, this doesn't seem to work properly but I've
%still left the code here for reference.
%images
%%% Julian Anthony Brackins   %%%
%%% CSC 514 - Computer Vision %%%
%%% Project 2                 %%%

%Im = zeros(xMax - xMin, yMax - yMin);

Img1(isnan(Img1))= 0;
Img2(isnan(Img2))= 0;

%im = Img1/2  + Img2/2 ;
%figure, imshow(im);
    figure, imshowpair(Img1,Img2,'blend');

end