function drawPOINTS()
	global POINTS;
	global COLORS;

	for i = 1:numel(POINTS)
		drawPoint(POINTS(i), 's', COLORS.POINTS, 16);
	end	
end

