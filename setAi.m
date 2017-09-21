function [ A1, A2, A3 ] =...
         setAi(rho, alf,beta, e2p, e3p, e4p, u, um )
% calculation of Ai matrix
%   Detailed explanation goes here
% A1
A1 = zeros(5,5);
A1(1,1)= rho*beta*(u(1)-um(1));
A1(1,2)= rho;
A1(1,5)= -rho*alf*(u(1)-um(1));
A1(2,1) = 1.0+rho*beta*u(1)*(u(1)-um(1));
A1(2,2) = rho*u(1) +rho*(u(1)-um(1));
A1(2,5) = -rho*alf*u(1)*(u(1)-um(1));
A1(3,1) = rho*beta*(u(1)-um(1))*u(2);
A1(3,2) = rho*u(2);
A1(3,3) = rho*(u(1)-um(1));
A1(3,5) = -rho*alf*(u(1)-um(1))*u(2);
A1(4,1) = rho*beta*(u(1)-um(1))*u(3);
A1(4,2) = rho*u(3);
A1(4,4) = rho*(u(1)-um(1));
A1(4,5) = -rho*alf*(u(1)-um(1))*u(3);
A1(5,1) = (u(1)-um(1))*e2p;
A1(5,2) = e3p + rho*u(1)*(u(1)-um(1));
A1(5,3) = rho*(u(1)-um(1))*u(2);
A1(5,4) = rho*(u(1)-um(1))*u(3);
A1(5,5) = e4p*(u(1)-um(1));
% A2
A2 = zeros(5,5);
A2(1,1)= rho*beta*(u(2)-um(2));
A2(1,3)= rho;
A2(1,5)= -rho*alf*(u(2)-um(2));
A2(2,1) = rho*beta*u(1)*(u(2)-um(2));
A2(2,2) = rho*(u(2)-um(2));
A2(2,3) = rho*u(1);
A2(2,5) = -rho*alf*u(1)*(u(2)-um(2));
A2(3,1) = 1.0+rho*beta*u(2)*(u(2)-um(2));
A2(3,3) = rho*u(2) + rho*(u(2)-um(2));
A2(3,5) = -rho*alf*u(2)*(u(2)-um(2));
A2(4,1) = rho*beta*(u(2)-um(2))*u(3);
A2(4,3) = rho*u(3);
A2(4,4) = rho*(u(2)-um(2));
A2(4,5) = -rho*alf*(u(2)-um(2))*u(3);
A2(5,1) = (u(2)-um(2))*e2p;
A2(5,2) = rho*u(1)*(u(2)-um(2));
A2(5,3) = e3p + rho*(u(2)-um(2))*u(2);
A2(5,4) = rho*(u(2)-um(2))*u(3);
A2(5,5) = e4p*(u(2)-um(2));
% A3
A3 = zeros(5,5);
A3(1,1)= rho*beta*(u(3)-um(3));
A3(1,4)= rho;
A3(1,5)= -rho*alf*(u(3)-um(3));
A3(2,1) = rho*beta*u(1)*(u(3)-um(3));
A3(2,2) = rho*(u(3)-um(3));
A3(2,4) = rho*u(1);
A3(2,5) = -rho*alf*u(1)*(u(3)-um(3));
A3(3,1) = rho*beta*u(2)*(u(3)-um(3));
A3(3,3) = rho*(u(3)-um(3));
A3(3,4) = rho*u(2);
A3(3,5) = -rho*alf*u(2)*(u(3)-um(3));
A3(4,1) = 1.0+rho*beta*u(3)*(u(3)-um(3));
A3(4,4) = rho*u(3) + rho*(u(3)-um(3));
A3(4,5) = -rho*alf*u(3)*(u(3)-um(3));
A3(5,1) = (u(3)-um(3))*e2p;
A3(5,2) = rho*u(1)*(u(3)-um(3));
A3(5,3) = rho*u(2)*(u(3)-um(3));
A3(5,4) = e3p + rho*u(3)*(u(3)-um(3));
A3(5,5) = e4p*(u(3)-um(3));
%
end