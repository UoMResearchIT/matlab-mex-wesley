function V = VortexFilamentLoop(P,A,B,Gamma,rc) %#codegen
    
    % number of filaments
    Nfils = length(Gamma);
    % preallocate the velocity from each vortex filament
    Vjj = nan(3,Nfils);
    % loop over each filament
    for jj = 1:Nfils
        Vjj(:,jj) = VortexFilamentInduction(P,A(:,jj),B(:,jj),Gamma(1,jj),rc(1,jj));
    end
    % total velocity at the field point
    V = sum(Vjj,2);
end