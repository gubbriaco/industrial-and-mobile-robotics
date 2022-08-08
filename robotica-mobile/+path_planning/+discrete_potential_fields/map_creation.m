function map = map_creation( b, h, delta )
%creazione della mappa dei potenziali discreti
   
    map=zeros(h,b);
    map(:,1:delta)=inf;
    map(1:delta,:)=inf;  
    map(end-delta+1:end,:)=inf;
    map(:,end-delta+1:end)=inf;

end