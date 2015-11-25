function fig = SideBySide( image1, image2 )
%SideBySide Display two images next to one another
%%% Julian Anthony Brackins   %%%
%%% CSC 514 - Computer Vision %%%
%%% Project 2                 %%%
screensize = get( 0, 'Screensize' );
x = screensize(3);
y = screensize(4);

fig = figure('position', [0, 0, x, y]);


%Right Image
subplot(1,2,2);
imshow(image2);

%Left Image
subplot(1,2,1);
imshow(image1);

end
