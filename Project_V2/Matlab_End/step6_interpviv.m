%figure,imshow(cd);
%figure,imshow(joined);


for j=1:1:479
     if(j>2&&j<479)
                
                    y1=kernel15(I,j,sizeI);
                    y2=kernel25(J,j,1);
     else  
                    y1=I(j,sizeI);
                    y2=J(j,1);
                
     end
                
     found=0;
     
     
     
     xin=sizeI+1;
     
     for b=1:1:n-1
         if(cd(j,stripsize+b)==1||cd(j+1,stripsize+b)==1)
             if(xin==sizeI+1)
                 
                 y1fill=y1;
                 
                 for x=xin:1:sizeI+b
                     
                     joined(j,x)=y1;
                 end
                 
             else
                 y1fill=joined(j,xin);
                 y2fill=joined(j,b+sizeI-1);
                 
                 
                     if(y2fill<y1fill)
                         
                         dist=b+sizeI-xin;
                         
                         for x=xin:1:b+sizeI
                             l=x-xin+1;
                             tt=(double(y1fill)-((double(y1fill-y2fill)*double(l))/double(dist)));
                             joined(j,x)=ceil(tt);
                         end
                     else
                         for x=b+sizeI:-1:xin
                             
                            dist=b+sizeI-xin;
                            l=x-xin+1;
                            tt=(double(y2fill)-((double(y2fill-y1fill)*double(l))/double(dist)));
                            joined(j,x)=ceil(tt);
                         end
                     end
                 
             end
             xin=b+sizeI;
         end
     end
     
     
     if(xin==sizeI+1)
         y1fill=y1;
     else
         y1fill=y2;
     end
     
     y2fill=y2;
     
     
         
                     if(y2fill<y1fill)
                         
                         dist=b+sizeI-xin;
                         
                         for x=xin:1:b+sizeI+1
                             l=x-xin+1;
                             tt=(double(y1fill)-((double(y1fill-y2fill)*double(l))/double(dist)));
                             joined(j,x)=ceil(tt);
                         end
                     else
                         for x=b+sizeI+1:-1:xin
                             
                            dist=b+sizeI-xin;;
                            l=b+sizeI-x;
                            tt=(double(y2fill)-((double(y2fill-y1fill)*double(l))/double(dist)));
                            joined(j,x)=ceil(tt);
                         end
                     end
     
end
     %figure,imshow(joined);
     
                    