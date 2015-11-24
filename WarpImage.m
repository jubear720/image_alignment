function image = WarpImage( I, H, Padding1, Padding2 )
Ic2 = I;
I=im2double(rgb2gray(I));
%I = rgb2gray(I);
[sourcex ,sourcey]=size(I);




        xPad = Padding1(1);
        yPad = Padding1(2);
        Xmin = Padding2(1,1);
        Xmax = Padding2(2,1);
        Ymin = Padding2(1,2);
        Ymax = Padding2(2,2);
[Xsource, Ysource]=meshgrid(floor(Xmin):ceil(Xmax),floor(Ymin):ceil(Ymax));
Xsourcevec=Xsource(:);
Ysourcevec=Ysource(:);
XY=[Xsourcevec Ysourcevec ones(length(Xsourcevec),1)];
XpYp=H*XY';
XpYp=XpYp';
%Normalize Points
normal=1./XpYp(:,3);
XpYp(:,1)=normal.*XpYp(:,1);
XpYp(:,2)=normal.*XpYp(:,2);
XpYp(:,3)=normal.*XpYp(:,3);

Xp=reshape(XpYp(:,1),size(Xsource,1),size(Xsource,2))';
Yp=reshape(XpYp(:,2),size(Xsource,1),size(Xsource,2))';

[sourcemeshY, sourcemeshX]=meshgrid(1:sourcey, 1:sourcex); %Source Image Initial Mesh (source)

Ic2r=im2double(Ic2(:,:,1));
Ic2b=im2double(Ic2(:,:,2));
Ic2g=im2double(Ic2(:,:,3));

warpedimagered=interp2(sourcemeshX'+100,sourcemeshY',Ic2r',Xp,Yp); %Warp the Initial Source Mesh to the Transformed Mesh
warpedimageblue=interp2(sourcemeshX'+100,sourcemeshY',Ic2b',Xp,Yp);
warpedimagegreen=interp2(sourcemeshX'+100,sourcemeshY',Ic2g',Xp,Yp);

warpedimage(:,:,1)=warpedimagered;
warpedimage(:,:,2)=warpedimageblue;
warpedimage(:,:,3)=warpedimagegreen;

figure()
imshow(warpedimage,[]);
image = warpedimage;

end