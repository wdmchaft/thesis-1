holeRelSize = [0.5 0.2 0.1 0.01];
relMass = [5 1 0.1];
for p = 1:length(holeRelSize)
    for n = 1:length(relMass)
        figure((p-1)*length(relMass)+n)
        title(strcat('xi = ', num2str(holeRelSize(p)), '; mu = ', num2str(relMass(n))));
        xlabel('x');
        grid on;
        xlim([0 15]);
        saveas(gcf,strcat('xi = ', num2str(holeRelSize(p)), '; mu = ', num2str(relMass(n)), '.png'));
        
    end
end