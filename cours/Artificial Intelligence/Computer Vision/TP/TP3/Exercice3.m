%
clear;
close all;
pkg load image

%pkg load multithresh
%
im1=imread('hand.bmp');

k=3; % 3 classes
nbr_seuil = 2;
im=rgb2gray(im1);
figure, subplot(2,2,1),imshow(im1),title('Image couleur');
subplot(2,2,2),imshow(im),title('Image NDG');
subplot(2,2,3),imhist(im), title('Histo de l''image NDG');

%Seuillage automatique
%to imquantize to convert an image into a two-level image

%thresh  = multithresh(im, nbr_seuil);
%imbin = imquantize(im, thresh);
%subplot(2,2,4),imshow(imbin,[]),title('seuillage avec OTSU'),colormap('jet');

%
%
%% K means pour NDG

%[nrows ncols] = size(im);
%im=double(im);
%NDG = reshape(im,nrows*ncols,1);
%idx = kmeans(NDG,k);
%pixel_labels = reshape(idx,nrows,ncols);
% %comparaison
%figure,subplot(2,2,1),imshow(im1), title('Image origiale');
%subplot(2,2,2),imshow(imbin,[]),title('seuillage avec OTSU'),colormap('jet');
%subplot(2,2,3),imshow(pixel_labels,[]), title('K_means NDG avec k = 3'),colormap('jet');





% %% k means avec l'image couleur

imD=double(im1);
nrows = size(imD,1);
ncols = size(imD,2);

X = reshape(imD,nrows*ncols,3);

cluster_idx = kmeans(X,k)
pixel_labels_Couleur = reshape(cluster_idx,nrows,ncols);
%
subplot(2,2,4),imshow(pixel_labels_Couleur,[]), title('k=3 sur RGB'),colormap('jet');
% %
