
maxLevels = 8; 
filterSizeIm = 4;
filterSizeMask = 4;


im2 = im2double(imread('desert6.jpg'));
im1 = im2double(imread('titanic6.jpg'));
mask = im2double(imread('titanic_mask6.jpg'));



imBlend = zeros(size(im1));
for i=1:3
    imBlend(:,:,i) = pyramidBlending(im1(:,:,i), im2(:,:,i), mask, maxLevels, filterSizeIm, filterSizeMask);
end

figure;imshow(im2);
figure;imshow(im1)
figure;imshow(mask)
figure;imshow(imBlend)