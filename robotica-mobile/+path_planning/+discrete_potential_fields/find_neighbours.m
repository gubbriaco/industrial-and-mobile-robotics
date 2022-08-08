%funzione 'findNeighbours'
function [neighbours,N,E,S,W] = findNeighbours( Rig, Col, map)

    [m,n] = size(map);
    neighbours=[];
    N=0; E=0; S=0; W=0;
    
    if Col>1
        W=1;
    end
    if Col<n
        E=1;
    end
    if Rig>1
        N=1;
    end
    if Rig<m
        S=1;
    end
    
    if N && E && S && W
        
        neighbours=zeros(8,2);
        i=1;
        for r=-1:1
            for c=-1:1
                if r~=0 || c~=0
                    neighbours(i,:)=[Rig+r,Col+c];
                    i=i+1;
                end
            end
        end
        
    elseif N && E && S
        
        neighbours=zeros(5,2);
        i=1;
        for r=-1:1
            for c=0:1
                if r~=0 || c~=0
                    neighbours(i,:)=[Rig+r,Col+c];
                    i=i+1;
                end
            end
        end
        
    elseif N && E && W
        
        neighbours=zeros(5,2);
        i=1;
        for r=-1:0
            for c=-1:1
                if r~=0 || c~=0
                    neighbours(i,:)=[Rig+r,Col+c];
                    i=i+1;
                end
            end
        end
        
    elseif N && S && W
        
        neighbours=zeros(5,2);
        i=1;
        for r=-1:1
            for c=-1:0
                if r~=0 || c~=0
                    neighbours(i,:)=[Rig+r,Col+c];
                    i=i+1;
                end
            end
        end
        
    elseif E && S && W
        
        neighbours=zeros(5,2);
        i=1;
        for r=0:1
            for c=-1:1
                if r~=0 || c~=0
                    neighbours(i,:)=[Rig+r,Col+c];
                    i=i+1;
                end
            end
        end
        
    elseif N && W
        
        neighbours=zeros(3,2);
        i=1;
        for r=-1:0
            for c=-1:0
                if r~=0 || c~=0
                    neighbours(i,:)=[Rig+r,Col+c];
                    i=i+1;
                end
            end
        end
        
    elseif N && E
        
       neighbours=zeros(3,2);
        i=1;
        for r=-1:0
            for c=0:1
                if r~=0 || c~=0
                    neighbours(i,:)=[Rig+r,Col+c];
                    i=i+1;
                end
            end
        end
        
    elseif W && S
    
        neighbours=zeros(3,2);
        i=1;
        for r=0:1
            for c=-1:0
                if r~=0 || c~=0
                    neighbours(i,:)=[Rig+r,Col+c];
                    i=i+1;
                end
            end
        end
        
    elseif S && E
        
        neighbours=zeros(3,2);
        i=1;
        for r=0:1
            for c=0:1
                if r~=0 || c~=0
                    neighbours(i,:)=[Rig+r,Col+c];
                    i=i+1;
                end
            end
        end
        
    end
        
end
