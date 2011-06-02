function y = delta(x,cr,nu)
%нахождение точек, в которых однородная система имеет ненулевое решение

nu_ = 1 - nu;

m11 = besselj(0,x);
m12 = bessely(0,x);
m13 = besseli(0,x);
m14 = besselk(0,x);
    
m21 =  besselj(0,x)  -  1./x .* besselj(1,x)  *  nu_;
m22 =  bessely(0,x)  -  1./x .* bessely(1,x)  *  nu_;
m23 = -besseli(0,x)  +  1./x .* besseli(1,x)  *  nu_;
m24 = -besselk(0,x)  -  1./x .* besselk(1,x)  *  nu_;

m31 =  besselj(0,x*cr)  -  1./(x*cr) .* besselj(1,x*cr)  *  nu_;
m32 =  bessely(0,x*cr)  -  1./(x*cr) .* bessely(1,x*cr)  *  nu_;
m33 = -besseli(0,x*cr)  +  1./(x*cr) .* besseli(1,x*cr)  *  nu_;
m34 = -besselk(0,x*cr)  -  1./(x*cr) .* besselk(1,x*cr)  *  nu_;

m41 =  besselj(1,x*cr);
m42 =  bessely(1,x*cr);
m43 =  besseli(1,x*cr);
m44 = -besselk(1,x*cr);

A = [m11,m12,m13,m14; m21,m22,m23,m24; m31,m32,m33,m34; m41,m42,m43,m44];

D0 = det(A);

y=D0;