function [ K11, K12, K13, K21, K22, K23, K31, K32,K33 ] =...
         setKij(kai, mu, la, lamda, u )
% calculation of Kij matrix
%   Detailed explanation goes here
%% K11
K11 = zeros(5,5);
%
K11(2,2) = kai;
K11(3,3) = mu;
K11(4,4) = mu;
K11(5,2) = kai*u(1);
K11(5,3) = mu*u(2);
K11(5,4) = mu*u(3);
K11(5,5) = lamda;
%% K12
K12 = zeros(5,5);
%
K12(2,3) = la;
K12(3,2) = mu;
K12(5,2) = mu*u(2);
K12(5,3) = la*u(1);
%% K13
K13 = zeros(5,5);
%
K13(2,4) = la;
K13(4,2) = mu;
K13(5,2) = mu*u(3);
K13(5,4) = la*u(1);
%% K21
K21 = zeros(5,5);
%
K21(2,3) = mu;
K21(3,2) = la;
K21(5,2) = la*u(2);
K21(5,3) = mu*u(1);
%% K22
K22 = zeros(5,5);
%
K22(2,2) = mu;
K22(3,3) = kai;
K22(4,4) = mu;
K22(5,2) = mu*u(1);
K22(5,3) = kai*u(2);
K22(5,4) = mu*u(3);
K22(5,5) = lamda;
%% K23
K23 = zeros(5,5);
%
K23(3,4) = la;
K23(4,3) = mu;
K23(5,3) = mu*u(3);
K23(5,4) = la*u(2);
%% K31
K31 = zeros(5,5);
%
K31(2,4) = mu;
K31(4,2) = la;
K31(5,2) = la*u(3);
K31(5,4) = mu*u(1);
%% K32
K32 = zeros(5,5);
%
K32(3,4) = mu;
K32(4,3) = la;
K32(5,3) = la*u(3);
K32(5,4) = mu*u(2);
%% K33
K33 = zeros(5,5);
%
K33(2,2) = mu;
K33(3,3) = mu;
K33(4,4) = kai;
K33(5,2) = mu*u(1);
K33(5,3) = mu*u(2);
K33(5,4) = kai*u(3);
K33(5,5) = lamda;
%
end