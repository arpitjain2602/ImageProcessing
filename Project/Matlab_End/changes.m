vv1=imcrop(joined,[360 0 n 480]);

vv2=imresize(vv1,[480 15]);

vv3=cat(2,I,vv2);
vv4=cat(2,vv3,J);

joined=vv4;