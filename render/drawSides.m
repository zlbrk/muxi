function drawSides()
	global SIDES;
	global COLORS;

	for i = 1:numel(SIDES)
		drawSide(SIDES(i), COLORS.SIDES, 1.5);
	end	
end

