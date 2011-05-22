clear
youngModulus = 2e7;
puassonRatio = 0.3;
density = 1e3;
m = material.DefaultMaterial(youngModulus, puassonRatio, density);

radius = 3e-3;
thickness = 25e-6;

g = geometry.Solid(thickness,radius);
g_hole = geometry.SolidWithHole(thickness, radius, 1);
g_mass = geometry.SolidWithMass(thickness, radius, radius*0.1, 1);
g_mass.material = m;

solid = g.roots(5, [0 50], 1);

disp('solid: ')
disp(solid)


% holeRelSize = [0.5 0.2 0.1 0.01];
% for n = 1:length(holeRelSize)
%     g_hole.holeRadius = g_hole.radius .* holeRelSize(n);
%     hole = g_hole.roots(5, [0 50], 1);
%     disp('hole:')
%     disp(holeRelSize(n))
%     disp(hole)
% end

relMass = [0.1 1 5];
for n = 1:length(relMass)
    g_mass.mu = relMass(n);
    mass = g_mass.roots(5, [0 50], 1);
    disp('mass:')
    disp(relMass(n))
    disp(mass)
end