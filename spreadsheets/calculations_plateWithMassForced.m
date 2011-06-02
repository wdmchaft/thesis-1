syms lambda rho C1 C2 C3 C4 D nu mu R r s;
coefficients = [C1 C2 C3 C4];




% deflection
W = C1 * besselj(0,lambda*rho) + C2 * bessely(0, lambda*rho) + C3 * besseli(0,lambda*rho)+ C4 * besselk(0,lambda*rho);

% absolute term of deflection
W_absoluteTerm =  0.5*s/(lambda^4 * D) * (pi*lambda*r * ( bessely(1,lambda*r)*0.5 - besselj(1,lambda*r)*0.5 - besselk(1,lambda*r) - besseli(1,lambda*r) ) - (pi + 2));


% deflection derivative
dW = diff(W, rho);
dW2 = diff(W, rho, 2);

% moments of flections
M_phi = -D * ( nu * dW2 + dW / rho);
M_rho = -D * ( dW2 + nu / rho * dW);

% transverse force
Q = (M_phi - diff(M_rho*rho, rho)) / rho;
Q = simple(collect(Q,coefficients));

% compose matrix

% equations
row1 = subs(W, rho, R);
row2 = subs(dW, rho, R);
row3 = subs(dW, rho, r);
% Cn(rho) turns to 0 if rho = r. So no need for absolute term here
row4 = subs(2*pi*rho*Q - D * pi * rho^2 * mu * lambda^4 * W, rho, r);

rows = [row1  row2  row3  row4];

% absolute term column
absTerm = [W_absoluteTerm; 0; 0; 0];

% preallocate matrix
A = ones(length(coefficients)) .* rho;

% fill matrix
for n = 1:length(coefficients)
    substitution = zeros(1,length(coefficients));
    substitution(n) = 1;
    for k = 1:length(rows)
        matrix_element = subs(rows(k), coefficients, substitution);
        A(k,n)=matrix_element;
    end
end

% determinant
DELTA = det(A);
DELTA = collect(DELTA,[lambda r R D]);

% coefficients
% algebraic adjuncts
adjuncts = ones(1,length(coefficients)) .* rho;

for n = 1:length(coefficients)
    tmp_adjunct = A;
    tmp_adjunct(:,n) = absTerm;
    adjuncts(n) = factor(det(tmp_adjunct));
end

solved_coef = adjuncts./DELTA;
