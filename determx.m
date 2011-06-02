syms A1 A2 A3 A4 x... clear;

syms rho lambda puass r R cr ... positive;
    
W = A1*besselj(0,lambda*rho) + A2*bessely(0,lambda*rho) + A3*besseli(0,lambda*rho) + A4*besselk(0,lambda*rho);  % прогиб
    dW = diff(W,rho);
    dW2 = diff(W,rho,2);

M_rho = (dW2 + puass/rho*dW);  % определение момента, создаваемого нормальными напряжениями вдоль rho
    M_rho = (collect(collect(collect(collect(simple(  M_rho  ),A1),A2),A3),A4));  % упрощение и группировка по коэффициентам

M_phi = (dW/rho + puass*dW2);  % определение момента, создаваемого нормальными напряжениями вдоль phi
    M_phi = (collect(collect(collect(collect(simple(  M_phi  ),A1),A2),A3),A4));  % упрощение и группировка по коэффициентам
    
Q = (M_phi - diff(M_rho*rho, rho))/rho;  % определение поперечной силы, интегральной характеристики касательных напряжений, перпендикулярных rho
    Q = collect(collect(collect(collect(simple(  Q  ),A1),A2),A3),A4);  % упрощение и группировка по коэффициентам
    

W_R = subs(W,rho,R);
M_rho_R = subs(M_rho,rho,R);
M_rho_r = subs(M_rho,rho,r);
Q_r = subs(Q,rho,r);

% создание матрицы и определителя системы уравнений
delta=[];
for n='1':'4'    
    tmp1 = W_R;
    tmp2 = M_rho_R;
    tmp3 = M_rho_r;
    tmp4 = Q_r;
    for k='1':'4'
        tmp1=subs(tmp1,eval(char('A',k)'),k==n);
        tmp2=subs(tmp2,eval(char('A',k)'),k==n);
        tmp3=subs(tmp3,eval(char('A',k)'),k==n);
        tmp4=subs(tmp4,eval(char('A',k)'),k==n);        
    end
    delta=[delta,[tmp1;tmp2;tmp3;tmp4]];
end
clc;
delta=collect(delta,lambda^2);
% delta=subs(delta,lambda*r,x*cr);
% delta=subs(delta,lambda*R,x);
% delta=subs(delta,r*lambda,x*cr);
% delta=subs(delta,R*lambda,x);
delta
determ = det(delta);