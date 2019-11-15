function drawVoid()
	global ConStruct;
	global Colors;
	hold on
	fill([ConStruct.Z], [ConStruct.R], Colors.Void);
	hold off;
end
