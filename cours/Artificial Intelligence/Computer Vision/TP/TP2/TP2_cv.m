clc;clear all; close all;
pkg load image



% Exercice 1.1
%
%
 im=imread('cameraman.jpg');
 IB=imnoise(im, 'salt & pepper'); %  5%
 figure, subplot(1,2,1), imshow(im),title ('image originale');
 subplot(1,2,2), imshow(IB),title ('image bruite');
%
% % Declaration des filtres moyenneur
%
% %filtre moyenneur
%
 f3=fspecial('average',3);
 f5=fspecial('average',5);
 f7=fspecial('average',7);
%
 IFM3 = imfilter(IB,f3);
 IFM5 = imfilter(IB,f5);
 IFM7 = imfilter(IB,f7);
%
% %code d'affichage
 %figure;
 %subplot(2,2,1); imshow (IB); title ('image bruitee');
 %subplot(2,2,2); imshow (IFM3); title ('filtre moyenneur 3x3');
 %subplot(2,2,3); imshow (IFM5); title ('filtre moyenneur 5x5');
 %subplot(2,2,4); imshow (IFM7); title ('filtre moyenneur 7x7');
%
%
%
%
%
% %%% filtre median
%
 %IFmedian3 = medfilt2(IB,[3 3]);
 %IFmedian4 = medfilt2(IB,[4 4]);
 %IFmedian5 = medfilt2(IB,[5 5]);
 %IFmedian7 = medfilt2(IB,[7 7]);

 %figure, subplot(1,2,1), imshow(IFmedian3),title ('image 3x3');
 %subplot(1,2,2), imshow(IFmedian4),title ('image 4x4');

 %figure; subplot(2,2,1); imshow (IB); title ('image bruitee');
 %subplot(2,2,2); imshow (IFmedian3); title ('filtre median 3x3');
 %subplot(2,2,3); imshow (IFmedian5); title ('filtre median 5x5');
 %subplot(2,2,4); imshow (IFmedian7); title ('filtre median 7x7');
%
% % Exercice 1.2

%%%%% filtre de convolution

im=imread('cameraman.jpg');
 %h = [1 1 1 ; 1  1 -8; 1 1 1];
%
 %IC= imfilter(im,h);
 %figure;
 %imshow(IC)

% Exercice 1.3

%%%%% filtre gaussien


% %bruit guaussien
 noise=imnoise(im,'gaussian',0,0.1);
%

 %make filters' masks
 hAvg=fspecial('average',3);
 hGauss=fspecial('gaussian',9,1.5); %filter support about 6*sigma

 %filter image
 Avg=imfilter(noise,hAvg); % filtrer li mage av le filtre moyenneur hAvg
 Med=medfilt2(noise,[3 3]); % filtre median
 Gauss=imfilter(noise,hGauss);% filtrer l image av le filtre gaussien Gauss
  % display output
  figure,
  subplot(221), imshow(noise), title('image bruitee');
  subplot(222), imshow(Avg), title('filtre moyenneur');
  subplot(223), imshow(Med), title('filtre median');
  subplot(224), imshow(Gauss), title('filtre gaussien');


  %EAvg=mean((Avg(:)-im(:)).^2);
  %EMed=mean((Med(:)-im(:)).^2);
  %EGauss=mean((Gauss(:)-im(:)).^2);


