
function a= kernel35(img,x,y,z)
a=double(img(x,y,z))+double(img(x-1,y,z))+double(img(x+1,y,z))+double(img(x,y+1,z))+double(img(x,y-1,z))+double(img(x-1,y-1,z))+double(img(x+1,y+1,z))+double(img(x-1,y+1,z))+double(img(x+1,y-1,z));
a=a/9;
end

