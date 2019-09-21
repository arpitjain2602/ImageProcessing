% im2right = imread('http://192.168.0.102:8080/get_image?webcam=2');
% im1left  = imread('http://192.168.0.102:8080/get_image?webcam=1');  %Kindly ensure that either RasPi has this address or you change this address to correct RasPi address. Also start the server on RasPi
% % imwrite(im2right, 'im5.jpg','jpg');
% % imwrite(im1left, 'im4.jpg','jpg');
image1=imread('im1.jpg');
image2 =imread('im2.jpg');
changeI =rgb2gray(image1);
changeJ =rgb2gray(image2);
I= imresize(changeI,[480,640]);
figure,imshow(I);
J= imresize(changeJ,[480,640]);
figure,imshow(J);
%finalimage=cat(2,imageI,imageJ);

% image=imread('eg3.jpg');
% image=rgb2gray(image);




%to add 15 pixels iun the bottom
%image=imresize(finalimage,[480 1000])


%figure,imshow(image);

%
% figure,imshow(I);
% figure,imshow(J);
% 
sizeI=640;


n=40;
stripsize=5;


c=zeros(480,n);
cc=zeros(480,5);

Iedge=edge(I,'sobel');
% figure,imshow(Iedge);
Jedge=edge(J,'sobel');
% figure,imshow(Jedge);
ilu=imcrop(Iedge,[sizeI+1-5 0 stripsize-1 480]);
jlu=imcrop(Jedge,[0 0 stripsize 480]);

c1=cat(2,ilu,c);
c1c=cat(2,c1,jlu);

%figure,imshow(c1c);


c2c=cat(2,ilu,c);
c2=cat(2,c2c,jlu);
figure,imshow(c2);

cI=cat(2,c2c,cc);
cJc=cat(2,cc,c);
cJ=cat(2,cJc,jlu);
%figure,imshow(cI);


