function [ output ] = segmentacaoImagem(img)

%RGB->Gray image
Img2 = rgb2gray(uint8(img));

%Extracting features
output = getFeatures(Img2);


end

