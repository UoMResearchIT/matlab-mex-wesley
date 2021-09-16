function V = VortexPanelInduction(P,A,B,C,D,Gamma,rc)

% leg AB
[V,h] = PotentialVortexLineInduction(P,A,B,Gamma);
k     = VatisasCore(h,rc);
V_AB  = k*V;

% leg BC
[V,h] = PotentialVortexLineInduction(P,B,C,Gamma);
k     = VatisasCore(h,rc);
V_BC  = k*V;

% leg CD
[V,h] = PotentialVortexLineInduction(P,C,D,Gamma);
k     = VatisasCore(h,rc);
V_CD  = k*V;

% leg DA
[V,h] = PotentialVortexLineInduction(P,D,A,Gamma);
k     = VatisasCore(h,rc);
V_DA  = k*V;

% total velocity induced by the panel
V = V_AB + V_BC + V_CD + V_DA;

end 