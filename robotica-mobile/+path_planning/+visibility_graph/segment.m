function [ x, y ] = segment( Xs, Ys, Xf, Yf, step )

    % function che restituisce l'espressione di una retta passante per due 
    % punti, ovvero il segmento che li congiunge

    % i punti x,y restituiti sono sempre nell'ordine
    % LEFT-RIGHT DOWN-UP

    m = (Yf-Ys)/(Xf-Xs);
    q = -Xs*m + Ys;
    
    if m ~= Inf && m~=-Inf
        if Xf > Xs
            x = Xs:step:Xf;
        else
            x = Xs:-step:Xf;
            x = x(end:-1:1); % ordine crescente
        end
        if m~=0
            % retta GENERICA
            y = m*x + q;
        else
            % retta ORIZZONTALE
            % ad ogni valore del vettore x associo la stessa ordinata q
            y=zeros(1,length(x));
            y(1,:)=q;   
        end
    else
        % retta VERTICALE
        % divido la distanza tra Ys e Yf in base allo step
        % e ad ogni coordinata Y associo la stessa coordinata X=Xs=Xf
        if Yf > Ys
            y = Ys:step:Yf;
        else
            y = Ys:-step:Yf;
            y = y(end:-1:1); % ordine crescente
            
        end
        x=zeros(1,length(y));
        x(1,:) = Xs;     
        
    end
    

end

