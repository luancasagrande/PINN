function [ output ] = getFeatures( img )
% getFeatures is a function that receives an image, applies Single-level 
% discrete 2-D wavelet transform, and returns the mean value, standard
% deviation and energy of the sample
%
% input,
%   img : Image
%
% outputs,
%   output : mean, standard deviation and energy of LL, LH, HL, HH

%Applying Single-level discrete 2-D wavelet transform with type base
%function
[LL,LH,HL,HH] =dwt2(img,'haar');

% Wavelet Statistical Feature
% Mean
[a b] = size(LL);

meanLL = double(sum(sum(LL))/(a*b));
meanLH = double(sum(sum(LH))/(a*b));
meanHL = double(sum(sum(HL))/(a*b));
meanHH = double(sum(sum(HH))/(a*b));

% Standard Deviation
sumLL = uint32(0);
sumLH = uint32(0);
sumHL = uint32(0);
sumHH = uint32(0);

for i=1:a
    for j=1:b
        sumLL = sumLL + (LL(i,j)-meanLL)^2;
        sumLH = sumLH + (LH(i,j)-meanLH)^2;
        sumHL = sumHL + (HL(i,j)-meanHL)^2;
        sumHH = sumHH + (HH(i,j)-meanHH)^2;
    end
end

sdLL = double(sumLL/(a*b));
sdLH = double(sumLH/(a*b));
sdHL = double(sumHL/(a*b));
sdHH = double(sumHH/(a*b));

% Wavelet Co occurrrence Feature
% Energy
eLL = double(sum(sum(LL))^2);
eLH = double(sum(sum(LH))^2);
eHL = double(sum(sum(HL))^2);
eHH = double(sum(sum(HH))^2);

% Entropy

% entropyLL = double(0);
% entropyLH = double(0);
% entropyHL = double(0);
% entropyHH = double(0);
% 
% 
% for i=1:a
%     for j=1:b
%         entropyLL = entropyLL + (LL(i,j)*log2(LL(i,j)));
%         entropyLH = entropyLH + (LH(i,j)*log2(LH(i,j)));
%         entropyHL = entropyHL + (HL(i,j)*log2(HL(i,j)));
%         entropyHH = entropyHH + (HH(i,j)*log2(HH(i,j)));
%     end
% end
% 
% meanLH

% output = [meanLL sdLL eLL entropyLL meanLH sdLH eLH entropyLH meanHL sdHL eHL entropyHL meanHH sdHH eHH entropyHH]
output = [meanLL sdLL eLL meanLH sdLH eLH meanHL sdHL eHL meanHH sdHH eHH];

end

