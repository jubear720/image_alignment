function image = ShiftImage( I, H, Padding1, Padding2 )
%ShiftImage Obsolete function to shift one image p to the same position as a
%warped image p'
%%% Julian Anthony Brackins   %%%
%%% CSC 514 - Computer Vision %%%
%%% Project 2                 %%%

    %Get dimensions of second image
    [h, w, d] = size(I);

    if nargin > 2
        xPad = Padding1(1);
        yPad = Padding1(2);
        xMin = Padding2(1,1);
        xMax = Padding2(2,1);
        yMin = Padding2(1,2);
        yMax = Padding2(2,2);
        
        h = h% + yPad;
        w = w% + xPad;
            %im = zeros(h+yPad,w+xPad,3);
            %    imshow(im);
            %size(im)

    end
    %w = abs( xMin - xMax );

    redChannel=im2double(I(:,:,1));
    bluChannel=im2double(I(:,:,2));
    greChannel=im2double(I(:,:,3));

    shift=zeros(abs(ceil(yMin)),length(I(1,:,:)));

    redChannel=[shift; redChannel];
    bluChannel=[shift; bluChannel];
    greChannel=[shift; greChannel];

    image(:,:,1)=redChannel;
    image(:,:,2)=bluChannel;
    image(:,:,3)=greChannel;
  
end