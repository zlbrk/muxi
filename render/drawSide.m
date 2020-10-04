function drawSide(s, LineColor, LineWidth)
	global POINTS;
	global SIDES;

	SP_idx = SIDES(s.id).SP;
	Zsp = POINTS(SP_idx).Z;
	Rsp = POINTS(SP_idx).R;

	EP_idx = SIDES(s.id).EP;
	Zep = POINTS(EP_idx).Z;
	Rep = POINTS(EP_idx).R;
	hold on; % Замораживаем текущие оси координат
	plot([Zsp Zep], [Rsp Rep],...
	'Color', LineColor,...
	'LineWidth',LineWidth);
	hold off; % Замораживаем текущие оси координат
end

