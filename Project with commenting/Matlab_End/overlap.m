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
r1=0;

for setv=1:1:5
    
    
    for set=1:1:320
        test=imcrop(a,[637-set 1 4 480-setv]);
        test2=imcrop(b,[set setv 4 480-setv]);
        r=corr2(test,test2);
    
        if(r>0.85)
           if(r<r1)
               r1=r;
               found=set;
           
           
            break;
        end
        
    end
    
end

jjcr=imcrop(In,[0 0 637-set 480]);
bbcrop=imcrop(Jn,[set 0 637-set 480]);
comb=cat(2,jjcrop,bbcrop);
figure,imshow(comb);