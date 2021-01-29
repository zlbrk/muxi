function evalSides()
	global SIDES;

	for i = 1:numel(SIDES)
		evalSide(SIDES(i));
	end	
end

