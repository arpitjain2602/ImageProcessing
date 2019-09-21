image=imread('test.jpg');
image=rgb2gray(image);



%to add 15 pixels iun the bottom
image=imresize(image,[480,435])


figure,imshow(image);

image=imcrop(image,[0 0 480 640]);
I=imcrop(image,[0 0 210 480]);
J=imcrop(image,[230 0 200 480]);

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

figure,imshow(c1c);


c2c=cat(2,ilu,c);
c2=cat(2,c2c,jlu);
figure,imshow(c2);

cI=cat(2,c2c,cc);
cJc=cat(2,cc,c);
cJ=cat(2,cJc,jlu);
figure,imshow(cI);


