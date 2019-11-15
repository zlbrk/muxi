function drawPoints()
	global ConStruct;
	global Colors;

	for i = 1:numel(ConStruct)
		drawPoint(ConStruct(i), 's', Colors.Points, 16);
		% fprintf('Point %d is dwawn\n', i);
	end	
end

