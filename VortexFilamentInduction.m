function V = VortexFilamentInduction(P,A,B,Gamma,rc) %#codegen
[Vpotential,h] = PotentialVortexLineInduction(P,A,B,Gamma);
k = VatisasCore(h,rc);
V = k*Vpotential;
end 

 