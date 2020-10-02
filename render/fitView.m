% Перерисовка рабочего вида
function fitView()
	global ConStruct;
	global GA;

	uniqueZZ=unique([ConStruct.Z]);
	uniqueRR=unique([ConStruct.R]);

	xlim([min(uniqueZZ)-0.1 max(uniqueZZ)+0.1]);
	ylim([min(uniqueRR)-0.1 max(uniqueRR)+0.1]);
	daspect(GA.DataAspectRatio);

end