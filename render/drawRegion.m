function drawRegion()
	global POINTS;
	global COLORS;
	hold on
	fill([POINTS.Z], [POINTS.R], COLORS.Void);
	hold off;
end
