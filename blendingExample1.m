
maxLevels = 9; 
filterSizeIm = 10;
filterSizeMask = 3;


im2 = im2double(imread('moon_c.jpg'));
im1 = im2double(imread('peleg_padded.jpg'));
mask = im2double(imread('peleg_mask.jpg'));



imBlend = zeros(size(im1));
for i=1:3
    imBlend(:,:,i) = pyramidBlending(im1(:,:,i), im2(:,:,i), mask, maxLevels, filterSizeIm, filterSizeMask);
end

figure;imshow(im2);
figure;imshow(im1)
figure;imshow(mask)
figure;imshow(imBlend)