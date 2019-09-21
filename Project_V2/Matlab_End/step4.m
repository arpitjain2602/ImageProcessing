%n is the number of pixel missing, thus ccc is formed as blank portion between them.

%Construction/Joining of line across the blank portion is happening.

n=found;

ccc=zeros(480,n);

kelo=cat(2,ilu,ccc);
cd=cat(2,kelo,jlu);



if(noI>=noJ)
    for k=1:1:noI
        linesI{k}.jnt=0;
    end
    
    %trying joining the lines from right image(J) to left (I)
    
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
        linesI{found}.joint=1;
        yold=y1;
        for x=1:1:n
            
            y=y1+fix((y4-y1)*x/n);
            
            cd(y,x+stripsize)=1;%j
            
            if(yold-y>1)
                for yanna=y:1:yold
                    cd(yanna,x+stripsize)=1;%j
                end
            end
            
            if(y-yold>1)
                for yanna=yold:1:y
                    cd(yanna,x+stripsize)=1;%j
                end
            end
            yold=y;
        end
        
    end
end


%just the mirror of the file above.                    
            
   
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
        linesJ{found}.jnt=1;
        yold=y4;
        for x=1:1:n
            
            y=y4+fix((y1-y4)*x/n);
            
            cd(y,x+stripsize)=1;%j
            
            if(yold-y>0)
                for yanna=y:1:yold
                    cd(yanna,x+stripsize)=1;%j
                end
            end
            
            if(y-yold>0)
                for yanna=yold:1:y
                    cd(yanna,x+stripsize)=1;%j
                end
            end
            yold=y;
        end
        end
    end
end
        
        
            
 figure,imshow(cd);
 
            