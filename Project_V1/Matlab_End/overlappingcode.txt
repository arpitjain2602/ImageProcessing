vid1=videoinput('winvideo',1,'YUY2_640x480');
vid2=videoinput('winvideo',2,'YUY2_640x480');
image1=getsnapshot(vid1); 
image2=getsnapshot(vid2); 


I=ycbcr2rgb(image1); 
J=ycbcr2rgb(image2);



In = double(I)./double(max(I(:)));
Jn = double(J)./double(max(I(:)));
a=rgb2gray(In);
b=rgb2gray(Jn);
found=0;
havetobreak=0;
for setv=1:5:476
    test=imcrop(a,[636 1 4 480-setv]);
    for set=1:1:536
    
    
        test2=imcrop(b,[set setv 4 480-setv]);
    
        r=corr2(test,test2);
	
    
        if(r>0.85)
            havetobreak=1;
            found=set+5;
            break;
        end
        
    end
    if(havetobreak)
        break;
    end
end


jjcrop=imcrop(J,[found 0 640-found 480]);
comb=cat(2,I,jjcrop);
figure,imshow(I);
figure,imshow(J);
figure,imshow(comb);