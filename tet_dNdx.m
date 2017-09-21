function [dNdx] = tet_dNdx(xl)

% xl is of size: nshl*nsd

nshl = 4; % for tet
nsd = 3; % for 3D

% dNdxi is of size: nsd*nshl
% shape func. derivative with local coords.
% derivative of N1, N2, N3 and N4 with lambda1
% ...
% derivative of N1, N2, N3 and N4 with lambda3
% factor of 0.5 is used to be consistent with phSolver
dNdxi = 0.5*[1.0, 0.0, 0.0, -1.0;
             0.0, 1.0, 0.0, -1.0;
             0.0, 0.0, 1.0, -1.0];

dxdxi = zeros(nsd,nsd);

for i=1:nshl
  for j=1:nsd
    for k=1:nsd
      dxdxi(j,k) = dxdxi(j,k) + xl(i,j)*dNdxi(k,i);
    end
  end
end

dxidx = inv(dxdxi);

dNdx = dNdxi'*dxidx;
end
