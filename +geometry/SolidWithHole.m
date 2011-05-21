classdef SolidWithHole < geometry.Solid

    properties
        holeRadius
    end
    
    properties (GetAccess = 'private', SetAccess = 'private')
        xi
    end
    
    methods
        function obj = SolidWithHole(thickness, radius, holeRadius)
            obj = obj@geometry.Solid(thickness, radius);
            obj.holeRadius = holeRadius;
        end
    end
    
    methods (Access='protected', Hidden=true)
        function f = frequencyEquation(obj, x)
            f = besseli(0, x)*besselj(1, x)*besselk(1, x*obj.xi)*bessely(1, x*obj.xi) - besseli(0, x)*bessely(1, x)*besselj(1, x*obj.xi)*besselk(1, x*obj.xi) + besseli(1, x)*besselj(0, x)*besselk(1, x*obj.xi)*bessely(1, x*obj.xi) - besseli(1, x)*bessely(0, x)*besselj(1, x*obj.xi)*besselk(1, x*obj.xi) - besselj(0, x)*besselk(1, x)*besseli(1, x*obj.xi)*bessely(1, x*obj.xi) + besselj(1, x)*besselk(0, x)*besseli(1, x*obj.xi)*bessely(1, x*obj.xi) - besselk(0, x)*bessely(1, x)*besseli(1, x*obj.xi)*besselj(1, x*obj.xi) + besselk(1, x)*bessely(0, x)*besseli(1, x*obj.xi)*besselj(1, x*obj.xi);        
        end
    end
    
    methods
        function xi = get.xi(obj)
            xi = obj.holeRadius / obj.radius;
        end
    end
    
end

