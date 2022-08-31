function [sigma, lambda, lambdad] = lambda_sigma_poly_exec(sigma_step)

    sigma = 0 : sigma_step : 1;

    
    import polynomial.poly3;
    lambda = poly3(sigma);
    
    import polynomial.poly3d;
    lambdad = poly3d(sigma);
    
end