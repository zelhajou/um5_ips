clear all
close all
pkg load image

I=imread('textsample.tif');
figure, imshow(I,[]);

A= imread('a.tif');
c = normxcorr2(A,I);
figure, surf(c), shading flat





yoffSet = floor(size(A,2)/2);
xoffSet = floor(size(A,1)/2);

% The scores are in an image that is slightly bigger than the original
% image ... it is expanded by half the size of the template in all
% directions. So we will crop out the center portion.
Csub = imcrop(c, [yoffSet xoffSet size(I,2) size(I,1)]);
figure, imshow(Csub, []), impixelinfo;
% Choose a fixed threshold (scores range from -1.0 to +1.0)
%thresh = 0.75;
BW = im2bw(Csub, 0.7);
figure, imshow(BW);

%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%
% Method of connected components
[L,n] = bwlabel(BW);
stats = regionprops(L, 'centroid');
fprintf('The number of "a"s found is %d\n', n);
% Draw an asterisk at each letter in the original image
figure, imshow(I,[]);
centroids = [stats.Centroid];
hold on
for i = 1:2:2*n
plot(centroids(i), centroids(i+1), 'r*');
end
hold off
%%%%%%%%%%%%%%%
