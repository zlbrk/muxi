function initFigure()
	global GA;

	%% Определяем границы рабочего вида по умолчанию
	% ---------------------------------------
	ZMIN = -10;
	ZMAX =  10;
	RMIN = -10;
	RMAX =  10;
	% ---------------------------------------

	figure
	GA = gca();
	GA.Box='on';
	grid on
	xlim([ZMIN ZMAX]);
	ylim([RMIN RMAX]);
	xlabel('Z, mm');
	ylabel('R, mm');
	set(gca(),'FontSize', 16);

	daspect([1 1 1]);
end

