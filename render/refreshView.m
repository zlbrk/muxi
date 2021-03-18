% Перерисовка рабочего вида
function refreshView()
	global PCART;
	global SCART;
	global GA;
	global RGVP;
	global ModelStateCounter;
	
	cla(); % очищаем оси
	RGVP = []; % очищаем точки визуализации (иначе их будет накапливаться очень много)
 	evalSides(); % вычисляем координаты точек RGVP, необходимых для закраски региона 
	drawRegion(); % закращиваем регион
 	drawSides(); % рисуем стороны
	drawPoints(); % рисуем точки
	

	showPointIDs(); % Выводим номера точек

	xlim(GA.XLim);
	ylim(GA.YLim);
	daspect(GA.DataAspectRatio);

	title(sprintf('State #%d',ModelStateCounter));
	% legend('Orientation','horizontal');
	% legend('Location','northoutside');
	% legend('Location','northwestoutside');
end
