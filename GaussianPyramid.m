[pyr, filter] = GaussianPyramid(im, maxLevels, filterSize)
%
%sub_samp = filterSize-1;
if (maxLevels==0 || size(im))
return
a = [1 1];
a = conv2(a,a');
for i = 1:filterSize-2
   blur_mask = conv2(blur_mask , a);
end

filter = blur_mask(1,:);

%normalizing
blur_mask = blur_mask/sum(blur_mask(:));
pyr{1}=im;
for i = 2:maxLevels
    if 
    %managing borders with mirroring
    pad_im = padarray(pyr{i-1},filterSize-1,'symmetric');
    blur_im = conv2(pyr{i-1} , blur_mask);
    %cutting the image to original size
    blur_im = blur_im(filterSize-1 , end-filterSize-1);
    %subsample
    sub_im = blur_im(1:2:end,1:2:end) ;
    pyr{i} = sub_im;

end
  
 