%расчет

startx = [2,5,9,12,15,18,21,24,28];                     % aproximated roots

R = 3e-3;
cr = 0.001;                                 % r/R relative radius of te hole
nu = 0.3;                                  % Puasson coeffictient

figure(1);
fplot(strcat('(delta(x,',num2str(cr),',',num2str(nu),'))'),[0 30 -1000/cr^2 1000/cr^2],1000,'k');
    grid on;

figure(2)
for n = 1:length(startx)
    root(n) = fzero(strcat('delta(x,',num2str(cr),',',num2str(nu),')'),startx(n));
    
    lambda(n) = root(n)/R;
    
    subplot(length(startx),1,n);
        fplot( strcat( 'W(rho,',num2str(lambda(n)),',',num2str(R),',',num2str(cr),',',num2str(nu),')' ) ,[0 R],'k');
            grid on;
end;

figure(1);
hold on;
stem(root,zeros(1,length(root)),'k');
hold off;


disp('    cr        root1     root2     root3     root4     root5');
disp([cr root]);