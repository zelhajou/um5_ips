clc; clear all;close all;
pkg load image
% % % %Exercice 1.1
%
 im1=imread('sosie.png');
 im2=imread('scene.png');
 im2=rgb2gray(im2);
 im1_expansian=imadjust(im1);
 im2_expansian=imadjust(im2);
 figure,
subplot(2,2,1); imshow (im1);title('Image originale')
subplot(2,2,2);imshow(im1_expansian); title('Image améliorée')
subplot(2,2,3);imhist(im1);title ('Histogramme image avant')
subplot(2,2,4); imhist(im1_expansian); title('Histogramme image après')
 figure,
 subplot(2,2,1); imshow(im2); title('Image originale')
 subplot(2,2,2); imshow(im2_expansian); title('Expansion dynamique')
 subplot(2,2,3); imhist(im2); title('Histogramme avant')
 subplot(2,2,4); imhist(im2_expansian); title('Histogramme apres')
%
% % % %Exercice 1.2
%
 Im1_eq=histeq(im1);
 figure,
 subplot(2,2,1); imshow(im1); title('Image originale')
 subplot(2,2,2); imshow(Im1_eq); title('Egalisation')
 subplot(2,2,3); imhist(im1); title('Histogramme avant')
 subplot(2,2,4); imhist(Im1_eq); title('Histogramme apres')
%
 Im2_eq=histeq(im2);
figure,
 subplot(2,2,1); imshow(im2); title('Image originale')
 subplot(2,2,2); imshow(Im2_eq); title('Egalisation')
 subplot(2,2,3); imhist(im2); title('Histogramme avant')
 subplot(2,2,4); imhist(Im2_eq); title('Histogramme apres')


% %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% %Exercice 2 : Transformation géométrique
% %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% clc;
% clear;
% close all;
%
imgDegrade = im2double(rgb2gray(imread('ImageDegradee1.jpg')));
imgReference = im2double(rgb2gray(imread('ImageReference1.jpg')));
figure(1);
subplot(1,2,1); imshow(imgReference); title('Image de référence')
subplot(1,2,2); imshow(imgDegrade); title('Image dégradée')

 % Subtract without alignment
 imgDiffUnalign = abs(imgDegrade - imgReference);
 figure(2);
 imshow(imgDiffUnalign); title('La soustraction des deux images');

  % Subtract with alignment

 minSSE = inf;
           for dx = -2 : 2
               for dy = -2: 2  % -2,-1,0,1,2

                   %
                   imgTform = imtranslate(imgDegrade,[dx dy]);
                   %la formule de l'erreur
                   error = sum((imgTform(:) - imgReference(:)).^2);
                   %0
                   if error < minSSE
                       minSSE = error;
                       imgDegradeAlign = imgTform;
                       bestDx = dx;
                       bestDy = dy;
                   end
               end % dy
           end % dx
           fprintf('Best dx = %d, dy = %d\n', bestDx, bestDy);
           imgDiffAlign = abs(imgDegradeAlign - imgReference);
           figure(3);
           imshow(imgDiffAlign);  title('Différence après transformation');

           threshold = 0.1;
           figure(4);
           imgDiffAlign = imgDiffAlign > threshold;
           imshow(imgDiffAlign);  title('Résultat du seuillage');




%
