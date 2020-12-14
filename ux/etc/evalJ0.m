function [J0_Acm2] = evalJ0(Ua_V,Gap_mm)
	EPS0 = 8.85E-12; % Dielectric constant
	QE = -1.6e-19; % Electron charge
	ME = 9.1e-31; % Electron rest mass
% Нормировка в СИ
Gap_m = Gap_mm/1E3; % мм --> м

%EVALGAP Summary of this function goes here
%   Detailed explanation goes here
	J0_Am2 = 4*EPS0/9*sqrt(-2*QE/ME)*Ua_V^1.5/Gap_m^2; % Плотность тока, А/м^2
	J0_Acm2 = J0_Am2/1E4;
end

