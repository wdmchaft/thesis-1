function w = W(rho,lambda,R,cr,nu)
%решение системы методом Краммера с точностью до постоянного множителя (А4)
%и расчет прогиба

nu_ = 1 - nu;

x = lambda*R;

a11 = besselj(0,x);
a12 = bessely(0,x);
a13 = besseli(0,x);

b11 = -besselk(0,x);
    
a21 = -(-besselj(0,x)  +  1./x .* besselj(1,x)  *  nu_);
a22 = -(-bessely(0,x)  +  1./x .* bessely(1,x)  *  nu_);
a23 = -( besseli(0,x)  -  1./x .* besseli(1,x)  *  nu_);

b21 =  ( besselk(0,x)  +  1./x .* besselk(1,x)  *  nu_);

a31 = -(-besselj(0,x*cr)  +  1./(x*cr) .* besselj(1,x*cr)  *  nu_);
a32 = -(-bessely(0,x*cr)  +  1./(x*cr) .* bessely(1,x*cr)  *  nu_);
a33 = -( besseli(0,x*cr)  -  1./(x*cr) .* besseli(1,x*cr)  *  nu_);

b31 =  ( besselk(0,x*cr)  +  1./(x*cr) .* besselk(1,x*cr)  *  nu_);

A  = [a11, a12, a13; a21, a22, a23; a31, a32, a33];
B  = [b11; b21; b31];
D1 = A; D1(:,1) = B;
D2 = A; D2(:,2) = B;
D3 = A; D3(:,3) = B;

det0 = det(A);
det1 = det(D1);
det2 = det(D2);
det3 = det(D3);

AF1 = det1/det0;
AF2 = det2/det0;
AF3 = det3/det0;

w = AF1*besselj(0,lambda*rho) + AF2*bessely(0,lambda*rho) + AF3*besseli(0,lambda*rho) + besselk(0,lambda*rho);