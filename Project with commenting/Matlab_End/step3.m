%Number of lines in first image is noI and noJ are the lines in the right image.

%Line matching is done based upon their slope etc.


if(noI>=noJ)
    diff=480;
    nreq=20;
    
    for n=1:1:50
        diff(n)=0;
        for j=1:1:noJ
            
            min=480;
            
            for k=1:1:noI
                
                y1=linesI{k}.point1-fix((n*(linesI{k}.vert)/(linesI{k}.divide*2)));
                y2=linesJ{j}.point1+fix((n*(linesJ{j}.vert)/(linesJ{j}.divide*2)));
                
                if(abs(y1-y2)<abs(min))
                    if(abs(y1-y2)<100)
                         min=abs(y1-y2);
                    
                    end
                    
                end
                
            end
            
            if(min>100)
                min=400;
            end
            
            diff(n)=diff(n)+min;
        end
    end
    
end

%The following code is just the image of above code.

if(noI<noJ)
    diff=480;
    nreq=20;
    
    for n=1:1:50
        diff(n)=0;
        for j=1:1:noI
            
            min=480;
            
            for k=1:1:noJ
                
                y1=linesI{j}.point1-fix((n*(linesI{j}.vert)/(linesI{j}.divide*2)));
                y2=linesJ{k}.point1+fix((n*(linesJ{k}.vert)/(linesJ{k}.divide*2)));
                
                if(abs(y1-y2)<abs(min))
                    if(abs(y1-y2)<50)
                         min=abs(y1-y2);
                    end
                    
                end
                
            end
            
            if(min>100)
                min=400;
            end
            
            diff(n)=diff(n)+min;
        end
    end
    
end

min=10000;found=20;

for n=1:1:50
    
    now=diff(n);
    
    if(abs(now)<abs(min))
        min=now;
        found=n;
    end
end

disp(found);