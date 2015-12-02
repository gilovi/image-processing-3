function [exp_im] = expand(orig_im, factor , filter)
%expands an image 'orig_im' by factor 'factor'
i = 1:length(orig_im);

im_size =  size(orig_im(i));
filt_len = length(filter)-1;
blur_mask = arrayfun(@(filt) conv2(filt,filt')*4, filter);

i=1:length(factor);
exp_im(factor(i): factor(i) :im_size(i,1)*factor(i) , factor(i): factor(i): im_size(i,2)*factor(i)) = orig_im(i);
%%exp_im = im2double(exp_im);
%managing borders with mirroring
pad_im = padarray(exp_im ,[filt_len,filt_len],'symmetric');
exp_im = conv2(pad_im , blur_mask ,'same');
%cutting the image to original size
exp_im = exp_im(filt_len+1: end-filt_len , filt_len+1: end-filt_len);



end

