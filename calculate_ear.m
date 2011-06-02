clear
youngModulus = 40e6;
puassonRatio = 0.475;
density = 1.1e3;
m = material.DefaultMaterial(youngModulus, puassonRatio, density);

radius = 3e-3;
thickness = 15e-6;
boneRadius = sqrt(0.6)*radius;

g_mass = geometry.SolidWithMass(thickness, radius, boneRadius, 5);
g_mass.material = m;

p = Plate(m, g_mass);
freqz = p.eigenFrequencies(3);
freqz
[p1,p2] = fplot(@(x)freqW(x,[freqz],5),[0 20000],100);
    plot(p1,p2,'-k','LineWidth',2);
    hold off

% for n=1:length(freqz)
% 	fresponse = 1/(freqz(n)^4 - f)
% 
% end
