function f = poly(coeff, grade)
    
    syms t;
    f = 0;
    
    j = 1;
    for i = grade: -1 : 0
        f = f + (coeff(j)*t^i);
        j = j+1;
    end

end