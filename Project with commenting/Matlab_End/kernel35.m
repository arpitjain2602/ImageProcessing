
function a= kernel35(img,x,y,z)
a=double(img(x,y,z))+double(img(x-1,y,z))+double(img(x+1,y,z))+double(img(x,y+1,z))+double(img(x,y-1,z))+double(img(x-1,y-1,z))+double(img(x+1,y+1,z))+double(img(x-1,y+1,z))+double(img(x+1,y-1,z));
a=a+0.5*(double(img(x,y-2,z))+double(img(x,y-2,z))+double(img(x-2,y-2,z))+double(img(x-2,y,z))+double(img(x-2,y+2,z))+double(img(x,y+2,z))+double(img(x+2,y,z))+double(img(x-2,y-2,z)));
a=a+0.25*(double(img(x+3,y+3,z))+double(img(x-3,y+3))+double(img(x-3,y-3,z))+double(img(x+3,y-3,z)));
a=a/(9+4+1);



end

