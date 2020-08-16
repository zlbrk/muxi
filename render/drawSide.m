function drawSide(s, LineColor, LineWidth)
	global ConStruct;
	global Sides;

	SP_idx = Sides(s.id).SP;
	Zsp = ConStruct(SP_idx).Z;
	Rsp = ConStruct(SP_idx).R;

	EP_idx = Sides(s.id).EP;
	Zep = ConStruct(EP_idx).Z;
	Rep = ConStruct(EP_idx).R;
	hold on; % Замораживаем текущие оси координат
	plot([Zsp Zep], [Rsp Rep],...
	'Color', LineColor,...
	'LineWidth',LineWidth);
	hold off; % Замораживаем текущие оси координат
end

