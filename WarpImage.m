function image = WarpImage( I, H )


    %Get dimensions of second image
    [h, w, d] = size(I);

    %construct a meshgrid
    [ x, y ] = meshgrid( 1:w, 1:h );

    %shape pixels so they're in the appropriate data type
    pixel = [ x(:)'; y(:)' ];
    pix = [ pixel; ones(1, w*h) ];

    %Apply H matrix to the all pixels in scene
    scene  = H*pix;

    % Return to original coordinate frame
    xP=(scene(1,:)./(scene(3,:)))';
    yP=(scene(2,:)./(scene(3,:)))';
    xP = reshape(xP,  w,h);
    yP = reshape(yP,  w,h);

    % Warp image using homography calcs
    clear image
    image(:,:,1) = interp2(double(I(:,:,1)), xP,yP);
    image(:,:,2) = interp2(double(I(:,:,2)), xP,yP);
    image(:,:,3) = interp2(double(I(:,:,3)), xP,yP);

    %Reshape the image so it's not absolutely garbage
    image = reshape(image,[h w 3]);

end