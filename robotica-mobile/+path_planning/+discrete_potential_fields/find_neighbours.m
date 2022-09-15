%funzione 'findNeighbours'
function [neighbours,nord,est,sud,ovest] = find_neighbours( riga, colonna, mappa)

    [m,n] = size(mappa);
    neighbours=[];
    nord=0; est=0; sud=0; ovest=0;
    
    if colonna>1
        ovest=1;
    end
    if colonna<n
        est=1;
    end
    if riga>1
        nord=1;
    end
    if riga<m
        sud=1;
    end
    
    if nord && est && sud && ovest
        
        neighbours=zeros(8,2);
        i=1;
        for r=-1:1
            for c=-1:1
                if r~=0 || c~=0
                    neighbours(i,:)=[riga+r,colonna+c];
                    i=i+1;
                end
            end
        end
        
    elseif nord && est && sud
        
        neighbours=zeros(5,2);
        i=1;
        for r=-1:1
            for c=0:1
                if r~=0 || c~=0
                    neighbours(i,:)=[riga+r,colonna+c];
                    i=i+1;
                end
            end
        end
        
    elseif nord && est && ovest
        
        neighbours=zeros(5,2);
        i=1;
        for r=-1:0
            for c=-1:1
                if r~=0 || c~=0
                    neighbours(i,:)=[riga+r,colonna+c];
                    i=i+1;
                end
            end
        end
        
    elseif nord && sud && ovest
        
        neighbours=zeros(5,2);
        i=1;
        for r=-1:1
            for c=-1:0
                if r~=0 || c~=0
                    neighbours(i,:)=[riga+r,colonna+c];
                    i=i+1;
                end
            end
        end
        
    elseif est && sud && ovest
        
        neighbours=zeros(5,2);
        i=1;
        for r=0:1
            for c=-1:1
                if r~=0 || c~=0
                    neighbours(i,:)=[riga+r,colonna+c];
                    i=i+1;
                end
            end
        end
        
    elseif nord && ovest
        
        neighbours=zeros(3,2);
        i=1;
        for r=-1:0
            for c=-1:0
                if r~=0 || c~=0
                    neighbours(i,:)=[riga+r,colonna+c];
                    i=i+1;
                end
            end
        end
        
    elseif nord && est
        
       neighbours=zeros(3,2);
        i=1;
        for r=-1:0
            for c=0:1
                if r~=0 || c~=0
                    neighbours(i,:)=[riga+r,colonna+c];
                    i=i+1;
                end
            end
        end
        
    elseif ovest && sud
    
        neighbours=zeros(3,2);
        i=1;
        for r=0:1
            for c=-1:0
                if r~=0 || c~=0
                    neighbours(i,:)=[riga+r,colonna+c];
                    i=i+1;
                end
            end
        end
        
    elseif sud && est
        
        neighbours=zeros(3,2);
        i=1;
        for r=0:1
            for c=0:1
                if r~=0 || c~=0
                    neighbours(i,:)=[riga+r,colonna+c];
                    i=i+1;
                end
            end
        end
        
    end
        
end
