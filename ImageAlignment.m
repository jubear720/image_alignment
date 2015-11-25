function ImageAlignment( File1, File2, Method, Points, ran )
%ImageAlignment Script for Running program
%%% Julian Anthony Brackins   %%%
%%% CSC 514 - Computer Vision %%%
%%% Project 2                 %%%


if strcmp( File1, '<none>')
    File1 = 'img\Yosemite\Yosemite1.jpg';
    File2 = 'img\Yosemite\Yosemite2.jpg';
end
if strcmp( File2, '<none>')
    File1 = 'img\Yosemite\Yosemite1.jpg';
    File2 = 'img\Yosemite\Yosemite2.jpg';
end


Image1 = im2double(imread(File1));
Image2 = im2double(imread(File2));

fprintf('File1: %s\n', File1);
fprintf('File2: %s\n', File2);


    %%MANUAL MODE STUFF
    if strcmp( Method, 'Manual')
        if(Points < 4)
            Points = 4;
        end
        
        fprintf('Please select %d corresponding Points\n', Points);
        %%GET CORRESPONDENCES MANUALLY
        [p1, p2] =  GetCorrespondences( Image1, Image2, Points );
        close all
        fprintf('Computing Homography using DLT...\n');
        H = ComputeHomography( p1, p2 );
    else
        [ p1, p2] = SIFTCorrespondences( File2, File1 );
        if ( ran == 1 )
            %%USE RANSAC TO GET H
            fprintf('Computing RANSAC...\n');
            H = RANSAC( p1, p2 );
            fprintf('RANSAC Completed\n');

        else
            %OR NOT...
            fprintf('Computing Homography using DLT...\n');
            H = ComputeHomography( p1, p2 );
        end
    end

%%PERFORM WARPING AND OVERLAY
Image3 = Overlay( Image1, Image2, H );

%%DISPLAY THE PICTURE
figure;
imshow(Image3);

fprintf('End Of Program.\n');



end