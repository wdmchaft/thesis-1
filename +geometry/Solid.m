classdef Solid

    properties
        thickness
        radius
    end
    
    properties(SetAccess='private', GetAccess='private')
    end
    
    methods
        function obj = Solid(thickness, radius)
            obj.thickness = thickness;
            obj.radius = radius;
        end
        
        function plotEq(obj, lo, hi)
            fplot(@(x)obj.frequencyEquation(x), [lo, hi, -hi hi])
        end
        
        function root = roots(obj, nroots, limx, step)
        % finds roots of frequency equation on interval given by xlim
        % approimation points are taken from limx on step defined by step
            tmp = zeros(1, ceil((limx(2) - limx(1))/step));
            n = 0;
            for xval = (limx(1)+step):step:limx(2)
                n = n + 1;
                r = fzeroq(@(x)obj.frequencyEquation(x),xval);
                if ( ~isnan(r) )
                    tmp(n) = roundn(r,-8); % round to 1e-8
                end
                
                root = unique(tmp(find(tmp > 0)));
                if (length(root) == nroots )
                    break
                end
            end;
        end    
    end
    
    methods (Access='protected', Hidden=true)
        function f = frequencyEquation(obj, x)
            f = besselj(0,x) * besseli(1,x) + besselj(1,x) * besseli(0,x);        
        end
    end
    
end

