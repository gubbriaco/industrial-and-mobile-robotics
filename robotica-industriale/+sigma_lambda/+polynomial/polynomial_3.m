function p = polynomial_3(sigma)

    sigma2 = sigma.*sigma;
    sigma3 = sigma2.*sigma;
    p = -2*sigma3 + 3*sigma2;

end