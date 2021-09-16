function [V,h,l1,l2,cos1,cos2] = PotentialVortexLineInduction(P,A,B,Gamma) %#codegen
    
    % r0
    r0 = B - A;
    l0 = vecnorm(r0);
    % r1
    r1 = P - A;
    l1 = vecnorm(r1);
    % r2
    r2 = P - B;
    l2 = vecnorm(r2);
    % perpendicular distance
    if l0 == 0
        h = 0;
    else
        h = vecnorm(cross(r1,r2))/l0;
    end
    % if the perpendicular velocity is zero then set the components of the
    % induced velocity vector to zero and return from the function
    if h == 0
        V    = zeros(3,1);
        cos1 = 0;
        cos2 = 0;
        return
    end
    % cos1 and cos2
    cos1 = dot(r0,r1)/(l0*l1);
    cos2 = dot(r0,r2)/(l0*l2);
    % e
    e = cross(r1,r2)/vecnorm(cross(r1,r2));
    % induced velocity
    V = Gamma*(cos1 - cos2)*e/(4*pi*h);
    
end