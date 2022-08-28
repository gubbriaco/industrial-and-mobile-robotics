function delta = delta_angle(theta1, theta2)

    delta = atan2( sin(theta1-theta2), cos(theta1-theta2) );

end