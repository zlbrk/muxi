function drawSides()
	global ConStruct;
	global Sides;
	global Colors;

	for i = 1:numel(Sides)
		drawSide(Sides(i), Colors.Sides, 1);
	end	
end

