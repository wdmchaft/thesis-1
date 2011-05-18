classdef Solid

    properties
        thickness
        radius
    end
    
    properties(SetAccess='private', GetAccess='private')
    end
    
    methods
        function obj = Solid(radius, thickness)
            obj.thickness = thickness;
            obj.radius = radius;
        end
        
        function plotEq(obj, lo, hi)
            fplot(@(x)obj.frequencyEquation(x), [lo, hi, -hi hi])
        end
        
        function root = roots(obj, limx, step)
        % finds roots of frequency equation on interval given by xlim
        % approimation points are taken from limx on step defined by step
            root = zeros(size(1, limx(2)/step));
            n = 0;
            for xval = limx(1) + step:step:limx(2)/step
                n = n + 1;
                r = fzero(@(x)obj.frequencyEquation(x),xval);
                if ( ~isnan(r) )
                    root(n) = round(r*1e4)/1e4;
                end
            end;
            root = root(find(root > 0));
            root = unique(root);
        end        
    end
    
    methods (Access='protected', Hidden=true)
        function f = frequencyEquation(obj, x)
            f = besselj(0,x) * besseli(1,x) + besselj(1,x) * besseli(0,x);        
        end
    end
    
end

