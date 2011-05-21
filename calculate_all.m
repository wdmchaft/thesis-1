clear
%youngModulus = 2e7;
%m = material.DefaultMaterial(2e7, 0.3, 1e3);

radius = 3e-3;
thickness = 25e-6;

g = geometry.Solid(thickness,radius);
g_hole = geometry.SolidWithHole(thickness, radius, 1);

solid = g.roots(5, [0 50], 1);

disp('solid: ')
disp(solid)


holeRelSize = [0.5 0.2 0.1 0.01];
for n = 1:length(holeRelSize)
    g_hole.holeRadius = g_hole.radius .* holeRelSize(n);
    hole = g_hole.roots(5, [0 50], 1);
    disp('hole:')
    disp(holeRelSize(n))
    disp(hole)
end
