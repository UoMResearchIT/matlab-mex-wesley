function V = VortexPanelLoop(P,A,B,C,D,Gamma,rc) %#codegen
    assert(isa(P, 'double'))
    assert(isa(A, 'double'))
    assert(isa(B, 'double'))
    assert(isa(C, 'double'))
    assert(isa(D, 'double'))
    assert(isa(Gamma, 'double'))
    assert(isa(rc, 'double'))
    assert(size(A, 1) == 3)
    assert(size(A, 2) >= 1)
    assert(size(B, 1) == 3)
    assert(size(B, 2) >= 1)
    assert(size(C, 1) == 3)
    assert(size(C, 2) >= 1)
    assert(size(D, 1) == 3)
    assert(size(D, 2) >= 1)
    assert(size(P, 1) == 3)
    assert(size(P, 2) >= 1)
    assert(size(Gamma, 2) >= 1)
    assert(size(rc, 2) >= 1)
    
    % number of filaments
    Nfils = length(Gamma);
    % preallocate the velocity from each vortex filament
    Vjj = nan(3,Nfils);
    % loop over each filament
    for jj = 1:Nfils
        Vjj(:,jj) = VortexPanelInduction(P,A(:,jj),B(:,jj),C(:,jj),D(:,jj),Gamma(1,jj),rc(1,jj));
    end
    % total velocity at the field point
    V = sum(Vjj,2);
    
end