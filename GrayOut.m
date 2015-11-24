function GrayOut( LeftOrRight, pointCount, im1,im2, plot1, plotType1,  plot2, plotType2 )



    LeftOrRight = upper(LeftOrRight);
    
    description = strcat('Click on', num2str(pointCount));
    description = strcat(description, ' points');
    %Default = Left
    x = 1;
    y = 2;
    ix = im1;
    iy = im2;
    if strcmp( LeftOrRight, 'RIGHT' )
        ix = im2;
        iy = im1;
        x = 2;
        y = 1;
    elseif strcmp( LeftOrRight, 'LEFT' )
        ix = im1;
        iy = im2;
        x = 1;
        y = 2;
    end
   

    if strcmp( LeftOrRight, 'REVERT' )
        %Revert Both images to Colour, retain plots

        %Colourize Left Image, show Points
        subplot(1,2,1);
        imshow(   im1   );
        plot( plot1(1,:),plot1(2,:), plotType1 );
        title( '' );

        %Colourize Right Image, show Points
        subplot(1,2,2);
        imshow(   im2  );
        plot( plot2(1,:),plot2(2,:), plotType2 );
        title( '' );

    else
        %Gray out Left Or Right Image
        subplot(1,2,x);
        imshow( rgb2gray( ix ) );
        title( '' );
        if nargin > 4
            plot( plot1(1,:),plot1(2,:), plotType1 );
        end

        %Ensure Other Image is Colour
        subplot(1,2,y);
        imshow(  iy );
        title( description );
    end
    
    
   
    
    
end