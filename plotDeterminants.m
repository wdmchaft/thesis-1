clear
youngModulus = 2e7;
puassonRatio = 0.3;
density = 1e3;
m = material.DefaultMaterial(youngModulus, puassonRatio, density);

radius = 3e-3;
thickness = 25e-6;

g_mass = geometry.SolidWithMass(thickness, radius, radius*0.1, 1);
g_mass.material = m;

holeRelSize = [0.5 0.2 0.1 0.01];
relMass = [5 1 0.1];
for p = 1:length(holeRelSize)
    for n = 1:length(relMass)
        g_mass.mu = relMass(n);
        g_mass.holeRadius = g_mass.radius * holeRelSize(p);
        figure((p-1)*length(relMass)+n)
        g_mass.plotEq(0, 30);
    end
end