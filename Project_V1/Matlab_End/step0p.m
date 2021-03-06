clc;
clear all;

image=imread('im1.jpg');
maze =imread('im2.jpg');
image=rgb2gray(image);
maze =rgb2gray(maze);

%to add 15 pixels in the bottom of each image
I= imresize(image,[480,435]);
J= imresize(maze,[480,435]);
figure,imshow(I);
figure,imshow(J);

sizeI=210;
n=20;
stripsize=5;
c=zeros(480,n);
cc=zeros(480,5);

Iedge=edge(I,'sobel');
Jedge=edge(J,'sobel');
ilu=imcrop(Iedge,[sizeI+1-5 0 stripsize-1 480]);
jlu=imcrop(Jedge,[0 0 stripsize 480]);

c1=cat(2,ilu,c);
c1c=cat(2,c1,jlu);

%figure,imshow(c1c);
c2c=cat(2,ilu,c);
c2=cat(2,c2c,jlu);
%figure,imshow(c2);

cI=cat(2,c2c,cc);
cJc=cat(2,cc,c);
cJ=cat(2,cJc,jlu);
figure,imshow(cI);
figure,imshow(cJ);
