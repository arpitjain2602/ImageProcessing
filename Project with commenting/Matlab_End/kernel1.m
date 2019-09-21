
function a= kernel1(img,x,y)
a=double(img(x,y-1))+double(img(x,y-2))+double(img(x-1,y-1))+double(img(x-1,y-2))+double(img(x+1,y-1))+double(img(x+1,y-2))+double(img(x,y))+double(img(x-1,y))+double(img(x+1,y));
a=a/9;
end

