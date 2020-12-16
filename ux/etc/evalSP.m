clear all;
close all;
clc;

getRP = @(z2, r1, r2, Rs) getRingPenetration(z2, r1, r2, Rs);
getSP = @(z2, r2, Rs) getSpherePenetration(z2, r2, Rs);

getVP = @(z2, r2, Rs) getVisPoints(z2, r2, Rs);

r1 = 0;
r2 = 8.6/2;
Rs = 9.0;
z2 = 2.0;
z1 = getSP(z2, r2, Rs);


function [z1] = getRingPenetration(z2, r1, r2, Rs)
	
	if Rs<r2
		fprintf('Rs must be greater than r2\n');
		z1 = NaN;
		return 
	end

	alpha1 = asind(r1/Rs);
	alpha2 = asind(r2/Rs);
	if alpha1 ~=0
		dz1 = r1/tand(alpha1);
	else
		dz1 = Rs;
	end
	dz2 = r2/tand(alpha2);
	dz12 = dz1 - dz2;
	z1 = z2 - dz12;

	fprintf('r1 = %g\n', r1);
	fprintf('r2 = %g\n', r2);
	fprintf('Rs = %g\n', Rs);
	fprintf('z2 = %g\n', z2);
	fprintf('z1 = %g\n\n', z1);
	fprintf('dz12 = %g\n\n', dz12);
end

function [z1] = getSpherePenetration(z2, r2, Rs)
	if Rs<r2
		fprintf('Rs must be greater than r2\n');
		z1 = NaN;
		return 
	end

	alpha2 = asind(r2/Rs)
	dz2 = Rs*cosd(alpha2);
	dz1 = Rs;
	dz12 = dz1 - dz2;
	z1 = z2 - dz12;
	
	fprintf('r2 = %g\n', r2);
	fprintf('Rs = %g\n', Rs);
	fprintf('z2 = %g\n', z2);
	fprintf('z1 = %g\n\n', z1);
	fprintf('dz12 = %g\n\n', dz12);
end

function [zvp, rvp] = getVisPoints(z2, r2, Rs)
	if Rs<r2
		fprintf('Rs must be greater than r2\n');
		z1 = NaN;
		return 
	end
	N = 32;
	alpha2 = asind(r2/Rs);
	alphaN = linspace(0, alpha2, N);
	dzN = Rs*cosd(alphaN(N)); % расстояние от z2 (положение катода) до центра сферы
	for i = 1:N
		zvp(i) = z2 - (Rs*cosd(alphaN(i)) - dzN); % менее очевидно, но более компактно
		rvp(i) = Rs*sind(alphaN(i)); % это можно делать в первом цикле,
	end
	
end