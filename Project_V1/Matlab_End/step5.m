kepo=cat(2,I,ccc);
joined=cat(2,kepo,J);

if(noI>=noJ)
    for k=1:1:noI
        linesI{k}.jnt=0;
    end
    
    for j=1:1:noJ
        y4=linesJ{j}.point1;
        y3=linesJ{j}.point1+fix((n*(linesJ{j}.vert)/(linesJ{j}.divide*2)));
        diff=480;
        found=0;
        for k=1:1:noI
            
            if(linesI{k}.jnt==0)
                y2=linesI{k}.point1-fix((n*(linesI{k}.vert)/(linesI{k}.divide*2)));
                if(abs(y2-y3)<abs(diff))
                    diff=y2-y3;
                    found=k;
                end
                
            end
            
        end
        
        if(abs(diff)>100)
            for k=1:1:noI
               y2=linesI{k}.point1-fix((n*(linesI{k}.vert)/(linesI{k}.divide*2)));
                if(abs(y2-y3)<abs(diff))
                    diff=y2-y3;
                    found=k;
                end
            end
                
        end
        
        y1=linesI{found}.point1;
        yold=y1;
        filld1=joined(y1+1,sizeI);
        filld2=joined(y4+1,sizeI+n+1);
        fillu1=joined(y1-1,sizeI);
        fillu2=joined(y4-1,sizeI+n-1);
        
        
        for x=1:1:n
            
            
            
            y=y1+fix((y4-y1)*x/n);
            
            joined(y-1,x+sizeI)=fillu1+ceil((fillu2-fillu1)*x/n);%j
            joined(y,x+sizeI)=filld1+ceil((filld2-filld1)*x/n);
            
            if(yold-y>1)
                for yanna=y:1:yold
                    joined(yanna-1,x+sizeI)=fillu1+ceil((fillu2-fillu1)*x/n);%j
                    joined(yanna,x+sizeI)=filld1+ceil((filld2-filld1)*x/n);%j
                end
            end
            
            if(y-yold>1)
                for yanna=yold:1:y
                    joined(yanna-1,x+sizeI)=fillu1+ceil((fillu2-fillu1)*x/n);%j
                    joined(yanna,x+sizeI)=filld1+ceil((filld2-filld1)*x/n);%j
                end
            end
            yold=y;
        end
        
    end
end

    
            
   
if(noI<noJ)
    for k=1:1:noJ
        linesJ{k}.jnt=0;
    end
    
    for j=1:1:noI
        y4=linesI{j}.point1;
        y3=linesI{j}.point1-fix((n*(linesI{j}.vert)/(linesI{j}.divide*2)));
        diff=480;
        found=0;
        for k=1:1:noJ
            
            if(linesJ{k}.jnt==0)
                y2=linesJ{k}.point1+fix((n*(linesJ{k}.vert)/(linesJ{k}.divide*2)));
                if(abs(y2-y3)<abs(diff))
                    diff=y2-y3;
                    found=k;
                end
                
            end
            
        end
        
        if(abs(diff)>100)
            for k=1:1:noJ
               y2=linesJ{k}.point1+fix((n*(linesJ{k}.vert)/(linesJ{k}.divide*2)));
                if(abs(y2-y3)<abs(diff))
                    diff=y2-y3;
                    found=k;
                end
            end
                
        end
        if(found>0)
        y1=linesJ{found}.point1;
        yold=y4;
        
        if(y4>4&&y1>4)
        
        filld1=joined(y4+4,sizeI);
        filld2=joined(y1+3,sizeI+n+2);
        
        
        
            fillu1=joined(y4-4,sizeI);
        
            
        
        
        
            fillu2=joined(y1-4,sizeI+n+2);
        
            
        for x=1:1:n
            
            y=y4+fix((y1-y4)*x/n);
            
            joined(y-1,x+sizeI)=fillu2-ceil((fillu1-fillu2)*x/n);%j
            joined(y,x+sizeI)=filld2-ceil((filld1-filld2)*x/n);
            
            if(yold-y>0)
                for yanna=y:1:yold
                    joined(yanna,x+sizeI-1)=fillu1+ceil((fillu2-fillu1)*x/n);%j
                    joined(yanna,x+sizeI)=filld1+ceil((filld2-filld1)*x/n);%j;%j
                end
            end
            
            if(y-yold>0)
                for yanna=yold:1:y
                    joined(yanna,x+sizeI-1)=fillu1+ceil((fillu2-fillu1)*x/n);%j
                    joined(yanna,x+sizeI)=filld1+ceil((filld2-filld1)*x/n);%j;%j
                end
            end
            
            if(yold-y>0)
                
                yold=y+1;
            elseif(yold-y>0)
                yold=y-1;
            end
        end
        end
        
        end
    end
end


figure,imshow(joined);
                