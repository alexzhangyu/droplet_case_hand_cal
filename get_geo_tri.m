function [ area, normal, Ja ] = get_geo_tri( x1,x2,x3 )
% calculation the area, normal and jacobean of 2D triangle element
%   Detailed explanation goes here
  a = x2-x1;
  b = x3-x1;
  crs_ab = cross(a,b);
  area = 0.5*norm(crs_ab);
 %
  normal = zeros(1,3);
  normal(:) = crs_ab(:)/norm(crs_ab);
 %
  J_ref = 0.5;
  Ja = area/J_ref;


end

