function [pyr, filter] = GaussianPyramid(im, maxLevels, filterSize)
%
%sub_samp = filterSize-1;
%% prepare blur mask

    filter = conv_n_times([1 1],filterSize-1);
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