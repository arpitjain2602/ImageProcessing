
function a=kernel(img,x,y)
a=double(img(x,y))+double(img(x-1,y))+double(img(x+1,y))+double(img(x,y+1))+double(img(x,y-1))+double(img(x-1,y-1))+double(img(x+1,y+1))+double(img(x-1,y+1))+double(img(x+1,y-1));
a=a/9;
end

