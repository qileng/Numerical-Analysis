function [] = bisection(f,a,b,M,delta,epsilon)
    u = f(a);
    v = f(b);
    e = b-a;
    if u*v>0
        return
    end
    
    for k = 1: M
        e = e/2;
        c = a+e;
        w = f(c);
        fprintf("%s%f%s%f%s%f%s%f\n", "k:", k, ", c:", c, ", w:", w, ", e:", e);
        if abs(e)<delta
            if abs(w)>abs(f(a))
                fprintf("%s\n", "No root");
            end
            return
        end
        if abs(w)<epsilon
            return
        end
        if w*u < 0
            b = c;
            v = w;
        else
            a = c;
            u = w;
        end
    end
end

