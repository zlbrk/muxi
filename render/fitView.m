% Перерисовка рабочего вида
function fitView()
	global POINTS;
	global GA;

	uniqueZZ=unique([POINTS.Z]);
	uniqueRR=unique([POINTS.R]);

	xlim([min(uniqueZZ)-0.1 max(uniqueZZ)+0.1]);
	ylim([min(uniqueRR)-0.1 max(uniqueRR)+0.1]);
	daspect(GA.DataAspectRatio);

end