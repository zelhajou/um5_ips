clear
pkg load image




objet = imread('defaut.png');
fond = rgb2gray(imread('fond.png'));

division = double(objet)./double(fond);

figure,subplot(2,2,1),imshow(objet), title('image originale');
level=graythresh(objet);

subplot(2,2,2),imshow(im2bw(objet,level)),title('image seuillee avant');
subplot(2,2,3),imshow(uint8(division*255),[]), title('division');
subplot(2,2,4),imshow(im2bw(division,graythresh(division))), title ('image seuillee apres');



