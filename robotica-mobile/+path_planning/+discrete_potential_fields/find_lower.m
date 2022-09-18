function [boolean,path] = find_lower( distanceMap, R, C, r, path )

    
    [m,n] = size(distanceMap);
    N=0; E=0; S=0; W=0;
    
    if C>1
        W=1;
    end
    if C<n
        E=1;
    end
    if R>1
        N=1;
    end
    if R<m
        S=1;
    end
    
    boolean=0;
    
    if N && distanceMap(R-1,C)<distanceMap(R,C)
       path(r,1)=C; path(r,2)=R-1;
       boolean=1;
    elseif E && distanceMap(R,C+1)<distanceMap(R,C)
       path(r,1)=C+1; path(r,2)=R;
       boolean=1;
    elseif S && distanceMap(R+1,C)<distanceMap(R,C)
            path(r,1)=C; path(r,2)=R+1;
        boolean=1;
    elseif W && distanceMap(R,C-1)<distanceMap(R,C)
            path(r,1)=C-1; path(r,2)=R;
        boolean=1;
    elseif (N && E) && distanceMap(R-1,C+1)<distanceMap(R,C)
            path(r,1)=C+1; path(r,2)=R-1;
        boolean=1;
    elseif (E && S) && distanceMap(R+1,C+1)<distanceMap(R,C)
            path(r,1)=C+1; path(r,2)=R+1;  
        boolean=1;
    elseif (S && W) && distanceMap(R+1,C-1)<distanceMap(R,C)
            path(r,1)=C-1; path(r,2)=R+1;  
        boolean=1;
    elseif (W && N) && distanceMap(R-1,C-1)<distanceMap(R,C)
            path(r,1)=C-1; path(r,2)=R-1;  
         boolean=1;   
    end
        

end
