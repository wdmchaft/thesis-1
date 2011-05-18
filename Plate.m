classdef Plate
    %MATERIALCONSTANTS Summary of this class goes here
    %   Detailed explanation goes here
    
    properties (GetAccess='public')
        material
        geometry
    end
    
    properties (Dependent=true)
       flexualRigidity
    end
    
    methods
        function obj = Plate(material, geometry)
            obj.material = material;
            obj.geometry = geometry;
        end
        
        function D = get.flexualRigidity(obj)
            D = 2 * obj.material.youngModulus * obj.geometry.thickness^3 / (3 - 3 * obj.material.puassonRatio^2);
        end
        
        function f = eigenFrequencies(obj)
            lambdaR = obj.geometry.roots([0 20], 1);
            lambda = lambdaR ./ obj.geometry.radius;
            omega = sqrt(lambda.^4 .* obj.flexualRigidity() ./ (2 .* obj.geometry.thickness .* obj.material.density));
            f = omega ./ (2 .* pi);
        end
    end
    
end

