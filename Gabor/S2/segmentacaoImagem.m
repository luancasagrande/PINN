function [ output ] = segmentacaoImagem(img,v1,v2,v3)

size(img)
%The factor of downsampling for columns and rows
d1 = 5;
d2 = 5;

%Creating Gabor Filter Bank
gaborArray = gaborFilterBank(v1,v2,v3,v3);

%Extracting Features
output = gaborFeatures(uint8(img),gaborArray,d1,d2)';


end

