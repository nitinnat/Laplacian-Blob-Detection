clear
% DoG from David Lowe's paper.
impath = '../data/butterfly.jpg';
im = im2double(rgb2gray(imread(impath)));
s = 4;
sigma0 = 2;
octaves = 2;
sigma = sigma0;
threshold = 1;
scaleSpace = zeros(size(im,1),size(im,1),s*octaves);
sigma_vec = [];
% For the first octave.
% Start with sigma = sigma0 and multiply by 2^(j/s)
octaveSpace1 = zeros(size(im,1),size(im,2),s+1); %Two extra filters to account for difference
 for i = 1:s
     i, sigma
       filter = fspecial('gaussian', 2*ceil(sigma*2.5)+1, sigma);
       octaveSpace1(:,:,i) = (sigma^2) * imfilter(im,filter,'same','replicate');
       
       sigma = sigma0 * (2 ^(i/s));
 end
diffSpace1 = zeros(size(im,1),size(im,2),s-1);

for i = 2:s+1
   diffSpace1(:,:,i-1) = octaveSpace1(:,:,i) - octaveSpace1(:,:,i); 
end
 
 
im = imresize(im, 1/2,'bicubic');       

octaveSpace2 = zeros(size(im,1),size(im,2),s+1); %Two extra filters to account for difference
sigma = sigma0
 for i = 1:s
       filter = fspecial('gaussian', 2*ceil(sigma*2.5)+1, sigma);
       octaveSpace2(:,:,i) = (sigma^2) * imfilter(im,filter,'same','replicate');
       sigma = sigma0 * (2 ^(i/s));
 end

diffSpace2 = zeros(size(im,1),size(im,2),s);
for i = 2:s+1
   diffSpace2(:,:,i-1) = octaveSpace2(:,:,i) - octaveSpace2(:,:,i-1); 
end

%Resize the second set of difference images.
temp = zeros(size(diffSpace1));
for i = 1:size(diffSpace2,3)
   temp(:,:,i) = imresize(diffSpace2(:,:,i),[size(diffSpace1,1),size(diffSpace1,2)],'bicubic');
end
diffSpace2 = temp;

%Non maximum suppression in the 2D slices
%First, stack diffSpace1 and diffSpace2

diffSpace = cat(3,diffSpace1,diffSpace2);
for i = 1:size(diffSpace,3)
    ord = ordfilt2(diffSpace(:,:,i), 9, ones(3));
    diffSpace(:,:,i) = diffSpace(:,:,i) .* (ord == diffSpace(:,:,i));
    %Apply threshold in each 2D slice.
    temp = diffSpace(:,:,i);
    temp(temp < threshold) = 0;
    diffSpace(:,:,i) = temp;
end

for i = 1:size(diffSpace,3)
    if i == 1
        diffSpace(:,:,i) = max(diffSpace(:,:,i),diffSpace(:,:,i+1));
    elseif i == size(diffSpace,3)
        diffSpace(:,:,i) = max(diffSpace(:,:,i),diffSpace(:,:,i-1));
    else
        diffSpace(:,:,i) = max(diffSpace(:,:,i-1),max(diffSpace(:,:,i),diffSpace(:,:,i+1)));
    end
end

rs = [];
cs = [];
rads = [];
for i = 1:size(diffSpace,3)
   [r c] = find(diffSpace(:,:,i));
   rad = (sqrt(2) * sigma0 * (2 ^((i-1)/s)))*ones(size(r,1),1);
   rs = [rs;r];
   cs = [cs;c];
   rads = [rads;rad];
end


if length(cs) <= 2000
    show_all_circles(im,cs, rs, rads,'r',1);
end
