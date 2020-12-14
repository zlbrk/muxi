function [Gap_mm] = evalGap(Ua_V,J0_Acm2)
	EPS0 = 8.85E-12; % Dielectric constant
	QE = -1.6e-19; % Electron charge
	ME = 9.1e-31; % Electron rest mass
% Нормировка в СИ
	J0_Am2 = J0_Acm2*1E4
	
%EVALGAP Summary of this function goes here
%   Detailed explanation goes here
	Gap_m = sqrt(4*EPS0/9*sqrt(-2*QE/ME)*Ua_V^1.5/J0_Am2); % Расстояние катод-анод, м
	Gap_mm = Gap_m*1E3;
end

