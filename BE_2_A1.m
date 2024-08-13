%1ere image 
lune=im2gray(imread('Fig_Moon.tif'));

moon=fft2(lune);
CS_moon=fftshift(moon);
CS_log_moon=log(1+abs(CS_moon));

figure(1);
subplot(2,2,1); imagesc(lune); colormap gray;
subplot(2,2,2); imagesc(abs(moon)); colormap gray;
subplot(2,2,3); imagesc(abs(CS_moon).^0.5); colormap gray;
subplot(2,2,4); imagesc(abs(CS_log_moon)); colormap gray;

%2eme image
femme=imread('Fig_Woman.tif');

woman=fft2(femme);
CS_woman=fftshift(woman);
CS_log_woman=log(1+abs(CS_woman));

figure(2);
subplot(2,2,1); imagesc(femme); colormap gray;
subplot(2,2,2); imagesc(abs(woman)); colormap gray;
subplot(2,2,3); imagesc(abs(CS_woman).^0.5); colormap gray;
subplot(2,2,4); imagesc(abs(CS_log_woman)); colormap gray;


%3eme image
rayon=im2gray(imread('Fig_Xray.tif'));
%im2gray permet de convertir de RGB en niveaux de gris directement

ray=fft2(rayon);
CS_ray=fftshift(ray);
CS_log_ray=log(1+abs(CS_ray));

figure(3);
subplot(2,2,1); imagesc(rayon); colormap gray;
subplot(2,2,2); imagesc(abs(ray)); colormap gray;
subplot(2,2,3); imagesc(abs(CS_ray).^0.5); colormap gray;
subplot(2,2,4); imagesc(abs(CS_log_ray)); colormap gray;