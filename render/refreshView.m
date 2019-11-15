% Перерисовка рабочего вида
function refreshView()
	global GA;	
	cla(); % очищаем оси
	drawVoid(); % рисуем контур
	drawCathode(); % рисуем катод
	drawPoints(); % рисуем все точки
	highlightCart(); % подсвечиваем выбранные точки
	showPointIDs(); % Выводим номера точек

	xlim(GA.XLim);
	ylim(GA.YLim);
	daspect(GA.DataAspectRatio);
end