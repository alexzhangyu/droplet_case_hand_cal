function [ y_0, y_1 ] = get_value_qt( yl_0, yl_1, shp0, shp1,nsize )
% get the variables value at the corresponding quadrature
% points with one element
%   Detailed explanation goes here
global nshl
%
y_0 = zeros(nsize,1);
y_1 = zeros(nsize,1);

for i = 1:nshl
    for j = 1:nsize
      y_0(j,1) = y_0(j,1) + shp0(i)*yl_0(i,j);
      y_1(j,1) = y_1(j,1) + shp1(i)*yl_1(i,j);
    end
end

end

