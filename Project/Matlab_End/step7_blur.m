finalgray=joined;

for j=2:1:479
    for k=sizeI:1:sizeI+n+1
        finalgray(j,k)=kernel(joined,j,k);
    end
end

figure,imshow(finalgray);
imwrite(finalgray, 'final.jpg');
