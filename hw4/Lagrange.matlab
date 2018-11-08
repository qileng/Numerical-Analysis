function [c] = Lagrange(xn,yn)
%Lagrange Interpolation
    x = sym('x');
    P = 0;
    for i = 1:length(xn)
        L = sym(1);
        for j = 1:length(xn)
            if j == i
                continue;
            end
            L = L * (x-xn(j)) / (xn(i)-xn(j));
        end 
        P = P + L * yn(i);
    end
    P = simplify(P);
    c = double(coeffs(P, 'All'));
    return;
end

