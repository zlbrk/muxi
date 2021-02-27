function checkPickedPoint(PickedPoint)
	global PCART;

	for i = PickedPoint
		if ~ismember(i, PCART)
		pickPoints(i);
		end
	end
end