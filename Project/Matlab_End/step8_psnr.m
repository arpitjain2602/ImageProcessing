first=imcrop(finalgray,[sizeI 0 n 480]);
size(first)
second=imcrop(image,[sizeI 0 n 480]);
size(second)
P = 255;
% MSE =0;
MSE = mean(mean((first - second).^2));
PSNR = 10*log10(P^2/MSE);

%pku=sizeI+n+300;
%finale2=imcrop(image,[0 0 481 480]);
%P = 255;
%MSE =0;
%MSE = mean((finalgray(:)-finale2(:)).^2);
%PSNR2 = 10*log10(P^2/MSE);

diff4=first-second;
