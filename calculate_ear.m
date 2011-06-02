%clear
%youngModulus = 20e6;
%puassonRatio = 0.3;
density = 1.1e3;
m = material.DefaultMaterial(youngModulus, puassonRatio, density);

radius = 3e-3;
%thickness = 15e-6;
boneRadius = 0.8*radius;

g_mass = geometry.SolidWithMass(thickness, radius, boneRadius, 5);
g_mass.material = m;

p = Plate(m, g_mass);
freqz = p.eigenFrequencies(2);
freqz

[p1,p2] = fplot(@(f)freqW(f,p,3),[40 20000],100);
    p2 = p2./max(p2); %normalize
    loglog(p1,p2,'-k','LineWidth',2);
    xlim([40,20e3]);
    hold off
    grid on
    str_mech = strcat('E=',num2str(youngModulus,'%0.2g'),' \nu=',num2str(puassonRatio),' \rho_{0}=',num2str(density));
    str_geom = strcat('R=',num2str(radius),' R_{man}=',num2str(boneRadius),' h=',num2str(thickness),' \mu=',num2str(g_mass.mu));
    title({'Frequency response:'; str_mech; str_geom});
    xlabel({ 'frequency, Hz'; strcat('f_1=',num2str(freqz(1)),' f_2=',num2str(freqz(2))) });


filename=strcat('freq ',' E=',num2str(youngModulus,'%0.2g'),' nu=',num2str(puassonRatio),' rho=',num2str(density),' R=',num2str(radius),' R_man=',num2str(boneRadius),' h=',num2str(thickness),' mu=',num2str(g_mass.mu),'.eps');
exportfig(gcf,filename, 'width',6, 'fontmode','fixed', 'fontsize',12, 'Resolution', 96);