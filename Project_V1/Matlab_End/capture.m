im2right = imread('http://192.168.0.102:8080/get_image?webcam=2');
im1left  = imread('http://192.168.0.102:8080/get_image?webcam=1');  %Kindly ensure that either RasPi has this address or you change this address to correct RasPi address. Also start the server on RasPi
% im1left = imread('sherlhs1.jpg');
% im2right = imread('sherrhs1.jpg');
%im2right = imcrop(im2right, [60 0 640 480]);
%im1left = imcrop(im1left, [0 0 260 240]);
% imshow(im2right);
imwrite(im2right, 'im2.jpg','jpg');
% imshow(im1left);
imwrite(im1left, 'im1.jpg','jpg');
info = imfinfo('im1.jpg');
figure; imshow(im2right);