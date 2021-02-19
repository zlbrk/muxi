function drawPOINTS()
	global POINTS;
	global COLORS;
	global PCART;

	for i = 1:numel(POINTS)
		drawPoint(POINTS(i), 's', COLORS.POINTS, 16);
		if ~isempty(PCART)
			for i = PCART
			drawPoint(POINTS(i), 's', COLORS.Picked, 16); % подсвечиваем выбранные точки
			end
		end
	end	
end