syms lambda rho C1 C2 C3 C4 flexRig nu R r;

% deflection
W = C1 * besselj(0,lambda*rho) + C2 * bessely(0,lambda*rho) + C3 * besseli(0,lambda*rho) + C4 * besselk(0,lambda*rho);

% deflection derivative
dW = diff(W, rho);

% moments of flections
M_phi = -flexRig * ( nu * diff(W, rho, 2) + diff(W, rho) / rho);
M_rho = -flexRig * ( diff(W, rho, 2) + nu / rho * diff(W, rho));

% transverse force
Q = (M_phi - diff(M_rho, rho)) / rho;



% compose matrix


% equations
row1 = subs(W, rho, R);
row2 = subs(dW, rho, R);
row3 = subs(dW, rho, r);
row4 = subs(Q, rho, r);

rows = [row1  row2  row3  row4];
coefficients = [C1 C2 C3 C4];

% preallocate matrix
A = [rho rho rho rho; rho rho rho rho; rho rho rho rho; rho rho rho rho]
for n = 1:length(coefficients)
    current_coeff = coefficients(n);
    zero_coeff = setxor(current_coeff, coefficients);
    for k = 1:length(rows)
        matrix_element = subs(rows(k), zero_coeff, zeros(1,length(zero_coeff)));
        A(k,n)=simple(matrix_element);
    end
end