function [] = elm_if( coords_0, coords_1, yl_0, yl_1, uml_0, uml_1 )
%elm_if calculate the RHS and LHS for the interface intergal at element
%level
%   Detailed explanation goes here
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
global nqt nshl nflow nsd
nqt = 3;
nshl = 4; % Notice this choose, it is the same as PHASTA
          % Detailed explaination is in shape_function_table script
nflow = 5;
nsd = 3;
%% get the geometry info
[ area0, nv0, J0 ] = get_geo_tri(coords_0(1,1:3),coords_0(2,1:3),coords_0(3,1:3) );
[ area1, nv1, J1 ] = get_geo_tri(coords_1(1,1:3),coords_1(2,1:3),coords_1(3,1:3) );
%% pass the shape function table
 run shape_function_table.m
 global shp_qt_0 shp_qt_1
 global wgt_qt_0 wgt_qt_1
%
%%% start the quandrature loop
for iqt= 1:3
% get the Y at quadrature point
    [ y_qt_0, y_qt_1 ] = get_value_qt( yl_0, yl_1, shp_qt_0(iqt,:), shp_qt_1(iqt,:), nflow );
% get the mesh velocity at quadrature point
    [ um_qt_0, um_qt_1 ] = get_value_qt( uml_0, uml_1, shp_qt_0(iqt,:), shp_qt_1(iqt,:), nsd );
% get the thermodynamic varibles
    [ rho, alf, beta, mu, kai, la, lamda,...
      e1p, e2p, e3p,  e4p] = getthm( y_qt_0(1,1), y_qt_0(5,1), y_qt_0(2:4),...
                                     y_qt_1(1,1), y_qt_1(5,1), y_qt_1(2:4) );
     disp(rho);
% get the Ai matrix
% side 0: air    side 1: liquid
    [ A1_0, A2_0, A3_0 ] = setAi(rho(1,1), alf(1,1),beta(1,1),...
                                 e2p(1,1), e3p(1,1), e4p(1,1),...
                                 y_qt_0(2:4), um_qt_0 );
    [ A1_1, A2_1, A3_1 ] = setAi(rho(2,1), alf(2,1),beta(2,1),...
                                 e2p(2,1), e3p(2,1), e4p(2,1),...
                                 y_qt_1(2:4), um_qt_1 ); 
    disp(A3_0);
    disp(A3_1);
%     disp(A1_0);
%     disp(A1_1);
end


end

