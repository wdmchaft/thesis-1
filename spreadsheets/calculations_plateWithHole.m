syms lambda rho C1 C2 C3 C4 flexRig nu R r;
coefficients = [C1 C2 C3 C4];


% deflection
W = C1 * besselj(0,lambda*rho) + C2 * bessely(0,lambda*rho) + C3 * besseli(0,lambda*rho) + C4 * besselk(0,lambda*rho);

% deflection derivative
dW = diff(W, rho);

% moments of flections
M_phi = -flexRig * ( nu * diff(W, rho, 2) + diff(W, rho) / rho);
M_rho = -flexRig * ( diff(W, rho, 2) + nu / rho * diff(W, rho));

% simplify moments considering boundary conditions
M_phi_simple = ( nu * diff(W, rho, 2) );
M_rho_simple = ( diff(W, rho, 2) );

% transverse force
Q = (M_phi - diff(M_rho*rho, rho)) / rho;
Q = simple(collect(Q,coefficients));

% compose matrix

% equations
row1 = subs(W, rho, R);
row2 = subs(dW, rho, R);
row3 = subs(dW, rho, r);
row4 = subs(Q, rho, r);

rows = [row1  row2  row3  row4];

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
DELTA = simple(collect(DELTA,coefficients));