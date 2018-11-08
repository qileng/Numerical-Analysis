function [c] = Newton(xn,yn)
%Newton Interpolation
    P = sym(0);
    x = sym('x');
    prod = sym(1);
    for i = 1:length(xn)
        if i == 1
            P = P + yn(1);
        else
            prod = prod *(x-xn(i-1));
            P = P + prod*forward_difference(xn(1:i),yn(1:i));
        end
    end
    P = simplify(P);
    c = double(coeffs(P, 'All'));
end

function [d] = forward_difference(xn,yn)
%Recursively compute the forward difference
    if length(yn) == 2
        d = (yn(end)-yn(1)) / (xn(end)-xn(1));
        return;
    end
    y2 = yn(2:end);
    y1 = yn(1:end-1);
    x2 = xn(2:end);
    x1 = xn(1:end-1);
    d = (forward_difference(x2,y2)-forward_difference(x1,y1)) / (xn(end) - xn(1));
end

