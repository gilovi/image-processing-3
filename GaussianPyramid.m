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
    blur_mask = conv2(filter,filter');
    
%% filling pyr

    pyr{1}=im;
    for i = 2:maxLevels
        if any(size(pyr{i-1}/2)<16)
            break
        end
        %managing borders with mirroring
        %%pad_im = padarray(pyr{i-1},[filterSize-1,filterSize-1],'symmetric');
        blur_im = conv2(pyr{i-1} , blur_mask,'same');
        %cutting the image to original size
        %%blur_im = blur_im(filterSize-1 , end-filterSize-1);
        
        %subsample
        sub_im = blur_im(2:2:end,2:2:end) ;
        pyr{i} = sub_im;

    end

end