ver=1;
a=1;
t=joined;
for j=1:1:480
    for m=1:1:n
        if (cd(j,m+stripsize)==1)
            q=m;
            dmin=n-m;
            for k=n:-1:1
               if (cd(j,k+stripsize)==1)
               hor=j;
               a=ver;
               d=n-ver;
               ver=k+ver;
                  if (a==1)
                   for l=a:ver-1
                       if((hor==1)||(hor==480))
                           t(hor,sizeI+l)=t(hor,sizeI);
                       else
                           y1=kernel1(t,hor,sizeI);
                           y2=t(hor,sizeI+ver-1);
                           t(hor,sizeI+l)=(round(y1+(abs((y2-y1)*l/n))));
                       end
                   end
                  elseif (d==dmin)
                   for l=q+1:n
                       y1=kernel2(t,hor,sizeI+n+1);
                       y2=t(hor,sizeI+q);
                       t(hor,sizeI+l)=(round(y1+(abs((y2-y1)*(l-q)/n))));
                   end
                  else
                   for l=a+1:ver
                       y1=t(hor,sizeI+a);
                       y2=t(hor,sizeI+ver-1);
                       t(hor,sizeI+l)=(round(y1+(abs((y2-y1)*(l-a)/n))));
                   end
                  end
               else break;
               end
            end
            else
                       if((j==1)||(j==480))
                           t(j,sizeI+p)=t(j,sizeI);
                       else
                           y11=kernel1(t,j,sizeI);
                           y22=t(j,sizeI+p);
                           t(j,sizeI+l)=(round(y1+(((abs(y2-y1))*l/n))));
                       end
        end
    end
end

       
