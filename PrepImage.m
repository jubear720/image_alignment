function img_g = PrepImage( img )
%PrepImage Helper Function to convert to gray double image
%%% Julian Anthony Brackins   %%%
%%% CSC 514 - Computer Vision %%%
%%% Project 1                 %%%

    %img = imresize( img, 0.8 );
    img_g = rgb2gray( img );
    img_g = double( img_g );
    
end