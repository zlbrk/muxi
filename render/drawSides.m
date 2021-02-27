function drawSides()
	global SIDES;
	global COLORS;
	global SCART;

	for i = 1:numel(SIDES)
		drawSide(SIDES(i), COLORS.SIDES, 1.5);
		if ~isempty(SCART)
			for i = SCART
			drawSide(SIDES(i), COLORS.Picked, 2); % подсвечиваем выбранные сегменты
			end
		end	
	end	
end