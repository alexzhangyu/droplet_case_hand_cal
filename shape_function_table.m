% Store the shape funtion value for each local d.o.f at every quadrature
% point
%  In this case, only dealing with linear tri, so nqt = 3
%  However, to account the contribution from 4th node to the global
%  gradient of shape function, nshl = 4
%  Notice here, like PHASTA, choosing nshl = 4 and letting the shape
%  function of the 4th node to be zero for each quadrature point
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
global shp_qt_0 shp_qt_1
global wgt_qt_0 wgt_qt_1
%
global nqt;
global nshl; % see the comments above for reason
%
shp_qt_0 = zeros(nqt,nshl);
shp_qt_1 = zeros(nqt,nshl);
wgt_qt_0 = zeros(nqt,nshl);
wgt_qt_1 = zeros(nqt,nshl);
% filling in the shape function table
shp_qt_0(1,1:nshl) = [2.0/3.0 1.0/6.0 1.0/6.0 0.0];
shp_qt_1(1,1:nshl) = [2.0/3.0 1.0/6.0 1.0/6.0 0.0]; % flip the 2rd and 3nd column s
                                                    % since flipping the
                                                    % 2rd and 3rd node in 1
                                                    % side
wgt_qt_0(1,1:nshl) = 0.5.*[1.0/3.0 1.0/3.0 1.0/3.0 0.0]; % Notice for the const.
wgt_qt_1(1,1:nshl) = 0.5.*[1.0/3.0 1.0/3.0 1.0/3.0 0.0];
%
shp_qt_0(2,1:nshl) = [1.0/6.0 2.0/3.0 1.0/6.0 0.0];
shp_qt_1(2,1:nshl) = [1.0/6.0 1.0/6.0 2.0/3.0 0.0];
wgt_qt_0(2,1:nshl) = 0.5.*[1.0/3.0 1.0/3.0 1.0/3.0 0.0]; % Notice for the const.
wgt_qt_1(2,1:nshl) = 0.5.*[1.0/3.0 1.0/3.0 1.0/3.0 0.0];
%
shp_qt_0(3,1:nshl) = [1.0/6.0 1.0/6.0 2.0/3.0 0.0];
shp_qt_1(3,1:nshl) = [1.0/6.0 2.0/3.0 1.0/6.0 0.0];
wgt_qt_0(3,1:nshl) = 0.5.*[1.0/3.0 1.0/3.0 1.0/3.0 0.0]; % Notice for the const.
wgt_qt_1(3,1:nshl) = 0.5.*[1.0/3.0 1.0/3.0 1.0/3.0 0.0];
%