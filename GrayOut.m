function GrayOut( LeftOrRight, pointCount, images, plot1, plotType1,  plot2, plotType2 )

    LeftOrRight = upper(LeftOrRight);
    
    description = strcat('Click on', num2str(pointCount));
    description = strcat(description, ' points');
    %Default = Left
    x = 1;
    y = 2;
    if strcmp( LeftOrRight, 'RIGHT' )
        x = 2;
        y = 1;
    elseif strcmp( LeftOrRight, 'LEFT' )
        x = 1;
        y = 2;
    end
    
    if strcmp( LeftOrRight, 'REVERT' )
        %Revert Both images to Colour, retain plots

        %Colourize Left Image, show Points
        subplot(1,2,1);
        imshow(   images(1,:)   );
        plot( plot1(1,:),plot1(2,:), plotType1 );
        title( '' );

        %Colourize Right Image, show Points
        subplot(1,2,2);
        imshow(   images(2,:)  );
        plot( plot2(1,:),plot2(2,:), plotType2 );
        title( '' );

    else
        %Gray out Left Or Right Image
        subplot(1,2,x);
        imshow( rgb2gray( imread( images(x,:) ) ) );
        title( '' );
        if nargin > 3
            plot( plot1(1,:),plot1(2,:), plotType1 );
        end

        %Ensure Other Image is Colour
        subplot(1,2,y);
        imshow(  imread( images(y,:) ) );
        title( description );
    end
    
    
    
end