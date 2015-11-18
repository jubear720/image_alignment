function SideBySide( image1, image2 )
%SideBySide Display two images next to one another

screensize = get( 0, 'Screensize' );
x = screensize(3);
y = screensize(4);

figure('position', [0, 0, x, y]);


%Right Image
subplot(1,2,2);
imshow(image2);

%Left Image
subplot(1,2,1);
imshow(image1);

end
