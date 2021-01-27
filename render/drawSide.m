function drawSide(s, LineColor, LineWidth)
	global POINTS;
	global SIDES;
	global RGVP;

	s_CURV = SIDES(s.id).CURV;
	SP_idx = SIDES(s.id).SP;
	EP_idx = SIDES(s.id).EP;

	if s_CURV == 0
		% никаких вспомогательных функций. Просто рисуем отрезок
		
		Zsp = POINTS(SP_idx).Z;
		Rsp = POINTS(SP_idx).R;
			
		Zep = POINTS(EP_idx).Z
		Rep = POINTS(EP_idx).R

		RGVP = [RGVP; [Zep Rep]];

		hold on; % Замораживаем текущие оси координат
		plot([Zsp Zep], [Rsp Rep],...
		'Color', LineColor,...
		'LineWidth',LineWidth);
		hold off; % Размораживаем текущие оси координат
	else
		Zep = POINTS(EP_idx).Z;
		Rep = POINTS(EP_idx).R;
		[zap, rap] = getArcPoints(Zep, Rep, 1/s_CURV)

		RGVP = [RGVP; [zap, rap]];

		hold on; % Замораживаем текущие оси координат
		plot(zap, rap,...
		'Color', LineColor,...
		'LineWidth',LineWidth);
		hold off; % Размораживаем текущие оси координат
	end


function [zvp, rvp] = getArcPoints(z2, r2, Rs)
% function [zvp, rvp] = getArcPoints(EP_idx, Zep, Rep)

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
		zvp(i,1) = z2 - (Rs*cosd(alphaN(i)) - dzN); % менее очевидно, но более компактно
		rvp(i,1) = Rs*sind(alphaN(i)); % это можно делать в первом цикле
	end

end

end
