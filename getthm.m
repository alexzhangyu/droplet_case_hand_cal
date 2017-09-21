function [ rho, alf, beta, mu, kai, la, lamda,...
           e1p, e2p, e3p,  e4p  ] = getthm( p_air, T_air,u_air,...
                                                         p_l, T_l, u_l )
% calculating the thermodynamic variables at the QT for both gas and liquid
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% 
R=8314/29;
T0=288;
p0=1.0e5;
rho_air= p_air/R/T_air;
cv_air = R/0.4;
cp_air = (R/0.4)*1.4;
% alpha_p
aa_air = 1.0/T_air;
aa_l = 1.0e-4;
% beta_T
bb_air = 1.0/p_air;
bb_l = 1.0e-7;
%
rho_l_ref=100;
cv_l = 1460;
rho_l = rho_l_ref*(1.0 - aa_l*(T_l-T0)+ bb_l*(p_l-p0));
% viscousity
mu_air = 1.0e-5; %Dynamic viscousity
mu_l = 10.0;
kai_air = 4.0/3.0*mu_air; % \lamda+2*\mu
kai_l   = 4.0/3.0*mu_l;
la_air  = -2.0/3.0*mu_air; %second coefficient of viscosity
la_l    = -2.0/3.0*mu_l;
% thermal conductivity
lamda_air = 0.046;
lamda_l = 0.6;
% enthalpy
hh = zeros(2,1);
hh(1,1) = cp_air*T_air; %air
hh(2,1) = cv_l*T_l + p_l/rho_l;
% e1
e1 = zeros(2,1);
e1(1,1) = hh(1,1) + 0.5*(dot(u_air,u_air));
e1(2,1) = hh(2,1) + 0.5*(dot(u_l,u_l));
% e1^p
e1p = zeros(2,1);
e1p(1,1) = rho_air*bb_air*e1(1,1)-aa_air*T_air;
e1p(2,1) = rho_l*bb_l*e1(2,1)-aa_l*T_l;
% e2^p
e2p = zeros(2,1);
e2p(:,:) = e1p(:,:) + 1;
% e3^p
e3p = zeros(2,1);
e3p(1,1) = rho_air*e1(1,1);
e3p(2,1) = rho_l*e1(2,1);
% e4^p
e4p = zeros(2,1);
e4p(1,1) = -rho_air*aa_air*e1(1,1)+ rho_air*cp_air;
e4p(2,1) = -rho_l*aa_l*e1(2,1) + rho_l*cv_l;
% forming the outputs
n_phase = 2;
rho = zeros(n_phase,1); % 1st row for gas
                        % 2nd row for liquid
alf = zeros(n_phase,1);
beta = zeros(n_phase,1);
mu = zeros(n_phase,1);
kai = zeros(n_phase,1);
la = zeros(n_phase,1);
lamda = zeros(n_phase,1);
%
rho(1,1) = rho_air;
rho(2,1) = rho_l;
%
alf(1,1) = aa_air;
alf(2,1) = aa_l;
%
beta(1,1) = bb_air;
beta(2,1) = bb_l;
%
mu(1,1) = mu_air;
mu(2,1) = mu_l;
%
kai(1,1) = kai_air;
kai(2,1) = kai_l;
%
la(1,1) = la_air;
la(2,1) = la_l;
%
lamda(1,1) = lamda_air;
lamda(2,1) = lamda_l;
end

