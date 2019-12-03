% Перерисовка рабочего вида
function refreshView()
	global Cart;
	global GA;	
	
	cla(); % очищаем оси
	drawVoid(); % рисуем контур
	drawCathode(); % рисуем катод
	drawPoints(); % рисуем все точки
	if ~isempty(Cart)
		highlightCart(); % подсвечиваем выбранные точки
	end
	
	showPointIDs(); % Выводим номера точек

	xlim(GA.XLim);
	ylim(GA.YLim);
	daspect(GA.DataAspectRatio);
end