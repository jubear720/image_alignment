function ShowImage( img, caption )
%ShowImage Helper Function for displaying an image
%%% Julian Anthony Brackins   %%%
%%% CSC 514 - Computer Vision %%%
%%% Project 1                 %%%

    %Show images with appropriate descriptions
    figure, imshow( img,[] );    
    title( caption );
    
end