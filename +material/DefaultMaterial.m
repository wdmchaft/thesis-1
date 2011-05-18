classdef DefaultMaterial

    properties
        youngModulus
        puassonRatio
        density
    end
    
    methods
        function obj = DefaultMaterial(youngModulus, puassonRatio, density)
            obj.youngModulus = youngModulus;
            obj.puassonRatio = puassonRatio;
            obj.density = density;
        end
    end
    
end

