function [pyr, filter] = GaussianPyramid(im, maxLevels, filterSize)
%
%sub_samp = filterSize-1;
%% prepare blur mask

    a = [1 1];
    filter = a;
    for i = 1:filterSize-2
       filter = conv(filter , a);
    end

    %normalizing
    filter = filter/sum(filter(:));
    
%% filling pyr

    pyr{1}=im;
    for i = 2:maxLevels
        if any(size(pyr{i-1})/2<16)
            break
        end
         pyr{i} = reduce(pyr{i-1} , 2 , filter);
    end

end