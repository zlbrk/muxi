function initFigure(ZMIN, ZMAX, RMIN, RMAX)
	global GA;
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

