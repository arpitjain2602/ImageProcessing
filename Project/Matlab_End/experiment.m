% im2right = imread('http://192.168.0.102:8080/get_image?webcam=2');
% im1left  = imread('http://192.168.0.102:8080/get_image?webcam=1');  %Kindly ensure that either RasPi has this address or you change this address to correct RasPi address. Also start the server on RasPi
% imwrite(im2right, 'im2.jpg','jpg');
% imshow(im1left);
% figure; imshow(im2right);
% imwrite(im1left, 'im1.jpg','jpg');

image1=imread('im1.jpg');
image2 =imread('im2.jpg');
% image = double(image1)./double(max(image1(:)));
% maze = double(image2)./double(max(image2(:)));
I =rgb2gray(image1);
J =rgb2gray(image2);
% I= imresize(I,[480,640]);
% % imshow(I);
% J= imresize(J,[480,640]);
% found=0;
% havetobreak=0;
% max=0;
% foundv=0;
% for setv=1:1:2
%     for set=1:1:635
%          test=imcrop(I,[637-set 1 4 480-setv]);
%          test2=imcrop(J,[set setv 4 480-setv]);
%          r=corr2(test,test2);  
%          if(r>max)
%              max=r;
%              havetobreak=1;
%              found=set;
%              foundv=setv;
%          end        
%     end
%     
% end
% display(max);
% display(found);
% display(foundv);
%   if(max>0.6)
%       imageI=imcrop(I,[1 7 640-found 480-foundv]);
%       imageJ=imcrop(J,[found foundv 640-found 474-foundv]);
%       finalimage=cat(2,imageI,imageJ);
%      % figure; imshow(finalimage);
%       imwrite(finalimage, 'imgfin.jpg', 'jpg');
%       imshow(finalimage);
%       
%  break;
%   end
%   
% %  else
%      to add 15 pixels in the bottom of each image
            I= imresize(I,[480,635]);
            J= imresize(J,[480,635]);
            sizeI=210;
            n=10;
            stripsize=5;
            c=zeros(480,n);
            cc=zeros(480,5);
            Iedge=edge(I,'sobel');
            Jedge=edge(J,'sobel');
            ilu=imcrop(Iedge,[sizeI+1-5 0 stripsize-1 480]);
            jlu=imcrop(Jedge,[0 0 stripsize 480]);
            c1=cat(2,ilu,c);
            c1c=cat(2,c1,jlu);
            figure; imshow(c1c);
            c2c=cat(2,ilu,c);
            c2=cat(2,c2c,jlu);
            figure; imshow(c2);
            cI=cat(2,c2c,cc);
            cJc=cat(2,cc,c);
            cJ=cat(2,cJc,jlu);
            figure; imshow(cI);
            figure; imshow(cJ);
%  end
% if(foundv)
%   jjcrop=imcrop(image2,[found 0 640-found 480]);
%   iicrop=imcrop(image1,[0 0 640-found 480]);
% else
%  jjcrop=imcrop(image2,[found foundv 640-found 480-foundv]);
%  iicrop=imcrop(image1,[0 1 640-found 480-foundv]);
% end   
%   comb=cat(2,iicrop,jjcrop);
%   figure,imshow(I);
%   figure,imshow(J);
%   figure,imshow(comb);
%    
% clc;
% clear all;

% image=imread('test.jpg');
% image=rgb2gray(image);
% 
% 
% 
% %to add 15 pixels iun the bottom
% image=imresize(image,[480,600])
% 
% 
% figure,imshow(image);
% 
% image=imcrop(image,[0 0 600 480]);
% I=imcrop(image,[0 0 300 480]);
% J=imcrop(image,[320 0 400 480]);
% figure,imshow(I);
% figure,imshow(J);
% 
% sizeI=300;
% 
% 
% n=20;
% stripsize=5;
% 
% 
% c=zeros(480,n);
% cc=zeros(480,5);
% 
% Iedge=edge(I,'sobel');
% Jedge=edge(J,'sobel');
% ilu=imcrop(Iedge,[sizeI+1-5 0 stripsize-1 480]);
% jlu=imcrop(Jedge,[0 0 stripsize 480]);
% 
% c1=cat(2,ilu,c);
% c1c=cat(2,c1,jlu);
% 
% %figure,imshow(c1c);
% 
% 
% c2c=cat(2,ilu,c);
% c2=cat(2,c2c,jlu);
% %figure,imshow(c2);
% 
% cI=cat(2,c2c,cc);
% cJc=cat(2,cc,c);
% cJ=cat(2,cJc,jlu);
% %figure,imshow(cI);
% 
% 
