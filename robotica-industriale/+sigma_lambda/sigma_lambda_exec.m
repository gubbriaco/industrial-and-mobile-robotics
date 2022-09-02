function sigma_lambda_exec()

    global sigma_step sigma lambda derived_lambda

    sigma_step = 0.05;
    sigma = 0 : sigma_step : 1;


    import sigma_lambda.polynomial.polynomial_3;
    lambda = polynomial_3(sigma);

    import sigma_lambda.polynomial.polynomial_3_derived;
    derived_lambda = polynomial_3_derived(sigma);

end