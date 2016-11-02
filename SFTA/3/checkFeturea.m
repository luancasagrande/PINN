function [ output ] = checkFeturea(img)
% checkFeturea is a function that receives an image, removes the fourth
% band and returns this image
%
% input,
%   img : Image in analysis
%
% outputs,
%   output : Modified image

%Removing fourth band
try

img(:,:,4)=[];

catch M
    
end

img = uint8(img);
output = img;

%RGB->HSV
imgHsv = rgb2hsv(img);

%Creating mask
mask = imgHsv(:,:,1)>0.07 & imgHsv(:,:,1)<0.8 & img(:,:,3)<120;

%Checking the number of neighbors and removing if the number of neighbors
%is less than 4
B=ones(3); B(2,2)=0;
live=conv2(double(mask),B,'same');
mask(:,:)=live(:,:)>=4;

%Applying mask
output(:,:,1) = output(:,:,1).*uint8(mask);
output(:,:,2) = output(:,:,2).*uint8(mask);
output(:,:,3) = output(:,:,3).*uint8(mask);


end

