clear

youngModulus_values = [20e6 40e6 60e6];
puassonRatio_values = [0.3 0.475 0.495];
thickness_values = [15e-6 30e-6 45e-6];

youngModulus = 0;
puassonRatio = 0;
thickness = 0;
for E = 1:length(youngModulus_values)
    for nu = 1:length(puassonRatio_values)
        for h = 1:length(thickness_values)
            youngModulus = youngModulus_values(E);
            puassonRatio = puassonRatio_values(nu);
            thickness = thickness_values(h);
            
            run calculate_ear
        end
    end
end