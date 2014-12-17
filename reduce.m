function [red_im] = reduce( orig_im , factor , filter )
%
blur_mask = conv2(filter,filter');
blur_im = conv2(orig_im , blur_mask ,'same');
%subsample
red_im = blur_im(2:factor:end , 2:factor:end);

end

