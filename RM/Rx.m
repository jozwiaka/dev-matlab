function [R] = Rx(phi)
    R = [cos(phi) 0 sin(phi); 0 1 0; -sin(phi) 0 cos(phi)]; %y
    R = [cos(phi) -sin(phi) 0; sin(phi) cos(phi) 0; 0 0 1]; %z
    R = [1 0 0; 0 cos(phi) -sin(phi); 0 sin(phi) cos(phi)]; %x
end
