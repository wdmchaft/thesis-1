%find frequency
h = 25e-6;
E = 2e7;
rho_0 = 1000;

omega = sqrt( (root.^4.*E.*(h^2))./(3*(1-nu^2)*rho_0*R^4) );
f = omega/2/pi;