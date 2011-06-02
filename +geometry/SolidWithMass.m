classdef SolidWithMass < geometry.SolidWithHole

    properties
        mu
    end
    
    properties (SetAccess = 'private')
        xi
    end
    
    methods
        function obj = SolidWithMass(thickness, radius, holeRadius, mu)
            obj = obj@geometry.SolidWithHole(thickness, radius, holeRadius);
            obj.mu = mu;
        end
    end
    
    methods (Access='protected', Hidden=true)
        function f = frequencyEquation(obj, x)
           f = 4*pi*besseli(1, x*obj.xi)*besselj(1, x*obj.xi)*besselk(0, x)*bessely(1, x) - 4*pi*besseli(1, x*obj.xi)*besselj(1, x*obj.xi)*besselk(1, x)*bessely(0, x) + 4*pi*besseli(1, x*obj.xi)*bessely(1, x*obj.xi)*besselj(0, x)*besselk(1, x) - 4*pi*besseli(1, x*obj.xi)*bessely(1, x*obj.xi)*besselj(1, x)*besselk(0, x) + 4*pi*besselj(1, x*obj.xi)*besselk(1, x*obj.xi)*besseli(0, x)*bessely(1, x) + 4*pi*besselj(1, x*obj.xi)*besselk(1, x*obj.xi)*besseli(1, x)*bessely(0, x) - 4*pi*besselk(1, x*obj.xi)*bessely(1, x*obj.xi)*besseli(0, x)*besselj(1, x) - 4*pi*besselk(1, x*obj.xi)*bessely(1, x*obj.xi)*besseli(1, x)*besselj(0, x) - pi*obj.mu*x*obj.xi*besseli(0, x*obj.xi)*besselj(1, x*obj.xi)*besselk(0, x)*bessely(1, x) + pi*obj.mu*x*obj.xi*besseli(0, x*obj.xi)*besselj(1, x*obj.xi)*besselk(1, x)*bessely(0, x) + pi*obj.mu*x*obj.xi*besseli(0, x*obj.xi)*besselk(1, x*obj.xi)*besselj(0, x)*bessely(1, x) - pi*obj.mu*x*obj.xi*besseli(0, x*obj.xi)*besselk(1, x*obj.xi)*besselj(1, x)*bessely(0, x) - pi*obj.mu*x*obj.xi*besseli(0, x*obj.xi)*bessely(1, x*obj.xi)*besselj(0, x)*besselk(1, x) + pi*obj.mu*x*obj.xi*besseli(0, x*obj.xi)*bessely(1, x*obj.xi)*besselj(1, x)*besselk(0, x) - pi*obj.mu*x*obj.xi*besseli(1, x*obj.xi)*besselj(0, x*obj.xi)*besselk(0, x)*bessely(1, x) + pi*obj.mu*x*obj.xi*besseli(1, x*obj.xi)*besselj(0, x*obj.xi)*besselk(1, x)*bessely(0, x) + pi*obj.mu*x*obj.xi*besseli(1, x*obj.xi)*besselk(0, x*obj.xi)*besselj(0, x)*bessely(1, x) - pi*obj.mu*x*obj.xi*besseli(1, x*obj.xi)*besselk(0, x*obj.xi)*besselj(1, x)*bessely(0, x) - pi*obj.mu*x*obj.xi*besseli(1, x*obj.xi)*bessely(0, x*obj.xi)*besselj(0, x)*besselk(1, x) + pi*obj.mu*x*obj.xi*besseli(1, x*obj.xi)*bessely(0, x*obj.xi)*besselj(1, x)*besselk(0, x) - pi*obj.mu*x*obj.xi*besselj(0, x*obj.xi)*besselk(1, x*obj.xi)*besseli(0, x)*bessely(1, x) - pi*obj.mu*x*obj.xi*besselj(0, x*obj.xi)*besselk(1, x*obj.xi)*besseli(1, x)*bessely(0, x) + pi*obj.mu*x*obj.xi*besselj(0, x*obj.xi)*bessely(1, x*obj.xi)*besseli(0, x)*besselk(1, x) + pi*obj.mu*x*obj.xi*besselj(0, x*obj.xi)*bessely(1, x*obj.xi)*besseli(1, x)*besselk(0, x) + pi*obj.mu*x*obj.xi*besselj(1, x*obj.xi)*besselk(0, x*obj.xi)*besseli(0, x)*bessely(1, x) + pi*obj.mu*x*obj.xi*besselj(1, x*obj.xi)*besselk(0, x*obj.xi)*besseli(1, x)*bessely(0, x) - pi*obj.mu*x*obj.xi*besselj(1, x*obj.xi)*bessely(0, x*obj.xi)*besseli(0, x)*besselk(1, x) - pi*obj.mu*x*obj.xi*besselj(1, x*obj.xi)*bessely(0, x*obj.xi)*besseli(1, x)*besselk(0, x) - pi*obj.mu*x*obj.xi*besselk(0, x*obj.xi)*bessely(1, x*obj.xi)*besseli(0, x)*besselj(1, x) - pi*obj.mu*x*obj.xi*besselk(0, x*obj.xi)*bessely(1, x*obj.xi)*besseli(1, x)*besselj(0, x) + pi*obj.mu*x*obj.xi*besselk(1, x*obj.xi)*bessely(0, x*obj.xi)*besseli(0, x)*besselj(1, x) + pi*obj.mu*x*obj.xi*besselk(1, x*obj.xi)*bessely(0, x*obj.xi)*besseli(1, x)*besselj(0, x);
        end
    end
    
    methods
        function xi = get.xi(obj)
            xi = obj.holeRadius / obj.radius;
        end
    end
    
end

