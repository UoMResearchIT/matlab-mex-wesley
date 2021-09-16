close all;
clear;
clc;

% random number of inputs
Npoints = 1e2;
Nfils   = 1e2;
Npans   = 1e2;

% assign a random number of points
P = rand(3,Npoints);

% assign a random number of vortex filaments
A_fil     = rand(3,Nfils);
B_fil     = rand(3,Nfils);
rc_fil    = rand(1,Nfils);
Gamma_fil = rand(1,Nfils);

% assign a random number of vortex panels
A_pan     = rand(3,Nfils);
B_pan     = rand(3,Nfils);
C_pan     = rand(3,Nfils);
D_pan     = rand(3,Nfils);
rc_pan    = rand(1,Nfils);
Gamma_pan = rand(1,Nfils);

% loop over each point and then loop over each vortex filament
tic
V = nan(3,Npoints);
for ii = 1:Npoints % outer-loop to be parallised
    % ii-th point
    Pii     = P(:,ii);    
    % vortex filament induction
    Vf = VortexFilamentLoop_mex(Pii,A_fil,B_fil,Gamma_fil,rc_fil); % inner loop speed to be improved from MEX file
    % vortex panel induction
    Vp = VortexPanelLoop_mex(Pii,A_pan,B_pan,C_pan,D_pan,Gamma_pan,rc_pan); % inner loop speed to be improved from MEX file
    % sum the velocities together
    V(:,ii) = Vf + Vp;
end 
toc