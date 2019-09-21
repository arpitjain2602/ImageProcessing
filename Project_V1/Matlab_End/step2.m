noJ=0;
gap=0;

for j=1:1:480
    
    if(gap>0)
        gap=gap-1;
    end
    first=stripsize+n+1;
    if(cJ(j,first)==1&&gap==0)
        
        tvert=0;
        start=j;
        weight=5;
        noJ=noJ+1;
        
        if(cJ(j,first+1)==1||cJ(j-1,first+1)==1)
            
            for k=j:1:480
                if(cJ(k,first)==0)
                    break;
                end
            end
            
            start=k-1;
        end
        
        for k=j:1:480
            if(cJ(k,first)==0)
                endi=k-1;
                break;
            end
        end
        
        if(k-j==2)
            if(cJ(endi,first+1)==1&&cJ(endi-1,first+1)==1)
                if(cJ(endi+1,first+2)==1)
                    start=start;
                elseif(cJ(start-1,first+2)==1)
                    start=endi;
                end
            end
        end
        
        startn=start;
        weight=5;
        
        for x=first:1:first+stripsize-1
            
            for k=startn:1:480
                if(cJ(k,x)==0)
                    endi1=k-1;
                    break;
                end
            end
            
            for k=startn:-1:1
                if(cJ(k,x)==0)
                    endi2=k+1;
                    break;
                end
            end
            
            if(x<first+stripsize-1)
                down=0;
                up=0;
                
                if(cJ(endi1,x+1)==1||cJ(endi1+1,x+1)==1)
                    down=1;
                end
                
                if(cJ(endi2,x+1)==1||cJ(endi2-1,x+1)==1)
                    up=1;
                end
                
                if(down==1&&up==0)
                    endi=endi1;
                elseif(down==0&&up==1)
                    endi=endi2;
                else
                    if(endi1-startn<startn-endi2)
                        endi=endi2;
                    else
                        endi=endi1;
                    end
                end
            elseif(x==first+stripsize-1)
                if(endi1-startn>startn-endi2)
                    endi=endi1;
                else
                    endi=endi2;
                end
            end
            
            if(x<first+stripsize-1)
                if(endi>startn)
                    if(cJ(endi,x+1)==1)
                        vert=endi-startn;
                        startn=endi;
                    elseif(cJ(endi+1,x+1)==1)
                        vert=endi-startn+1;
                        startn=endi+1;
                    end
                elseif(endi<startn)
                    if(cJ(endi,x+1)==1)
                        vert=endi-startn;
                        startn=endi;
                    elseif(cJ(endi-1,x+1)==1)
                        vert=endi-startn-1;
                        startn=endi-1;
                    end
                elseif(startn==endi)
                    if(cJ(endi-1,x+1)==1)
                        vert=-1;
                        startn=endi-1;
                    elseif(cJ(endi+1,x+1)==1)
                        vert=1;
                        startn=endi+1;
                    elseif(cJ(endi,x+1)==1)
                        vert=0;
                        startn=endi;
                    end
                end
                
                outofloop=0;
                if(cJ(endi,x+1)==0&&cJ(endi-1,x+1)==0&&cJ(endi+1,x+1)==0)
                    vert=endi-startn;
                    outofloop=1;
                end
                
            elseif(x==first+stripsize-1)
                vert=endi-startn;
            end
            
            tvert=tvert+weight*vert;
            weight=weight-1;
            
            if(outofloop)
                divide=0;
                for b=5:-1:weight
                    
                    divide=divide+b;
                end
                break;
            elseif(x==first+stripsize-1)
                divide=15;
            end
            
        end
        
        linesJ{noJ}.point1=start;
        linesJ{noJ}.vert=tvert;
        linesJ{noJ}.divide=divide;
        
        for k=1:1:ceil(n/2)
            y=start-ceil((tvert*k)/divide);
            cJ(y,first-k)=1;
        end
        
        for k=j:1:480
            if(cJ(k,first)~=1)
                break;
            end
        end
        
        gap=k-j;
        
    end
    
end

%figure,imshow(cJ);
        