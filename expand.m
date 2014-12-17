function [exp_im] = expand(orig_im, factor , filter)
%expands an image 'orig_im' by factor 'factor'

im_size = size(orig_im);
filt_len = length(filter)-1;
blur_mask = conv2(filter,filter')*4;


exp_im(2: factor :im_size(1)*2 , 2: factor: im_size(2)*2) = orig_im;
%%exp_im = im2double(exp_im);
%managing borders with mirroring
pad_im = padarray(exp_im ,[filt_len,filt_len],'symmetric');
exp_im = conv2(pad_im , blur_mask ,'same');
%cutting the image to original size
exp_im = exp_im(filt_len+1: end-filt_len , filt_len+1: end-filt_len);



end

