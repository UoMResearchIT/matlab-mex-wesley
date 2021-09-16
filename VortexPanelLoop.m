function V = VortexPanelLoop(P,A,B,C,D,Gamma,rc)

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