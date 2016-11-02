function [ output ] = checkClass(img)
    perc = sum(sum(img))/(size(img,1)*size(img,2));
    if(perc<=0.5)
        
        output = 1;
    else
        
        output = 0;
    end

end

