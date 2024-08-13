function [] = lp_design(ftype,D0,taille_im)
M = taille_im(1,1);
N = taille_im(1,2); 
if isnumeric(D0)
        if ftype == "gaussian"
            H = fftshift(lpfilter('gaussian', M, N, D0));
        elseif ftype == "ideal"
            H = fftshift(lpfilter('ideal', M, N, D0));
        elseif ftype == "btw"
            n = input("Quelle est l'ordre du filtre de Butterworth que vous désirez ?")
            H = fftshift(lpfilter('btw', M, N, D0,n));
        else
            disp("Le type de filtre demandé est incorrect")
        end
else
    disp("Le DO n'est pas un nombre")
end

%Passage du domaine fréquentiel au domaine spatial
h = fftshift(ifft2(H));

%Réponse fréquentielle
[X, Y] = meshgrid(1:N, 1:M);
figure(1);
mesh(X, Y, abs(H));
xlabel('X - Fréquence (Hz)');
ylabel('Y - Fréquence (Hz)');
zlabel('Amplitude');
title('Réponse fréquentielle du filtre');

%Réponse fréquentielle impulsionnelle
figure(2);
mesh(X, Y, abs(h));
xlabel('Largeur (X)');
ylabel('Hauteur (Y)');
zlabel('Amplitude');
title('Réponse impulsionnelle du filtre');