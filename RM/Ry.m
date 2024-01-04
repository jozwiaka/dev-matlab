function [R] = Ry(phi)
    R = [cos(phi) 0 sin(phi); 0 1 0; -sin(phi) 0 cos(phi)]; %y
end
