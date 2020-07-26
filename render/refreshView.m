% Перерисовка рабочего вида
function refreshView()
	global Cart;
	global GA;
	global ModelStateCounter;
	
	cla(); % очищаем оси
	drawVoid(); % рисуем контур
 	showBC(); % отображаем граничные условия
	drawCathode(); % рисуем катод
	drawPoints(); % рисуем все точки
	if ~isempty(Cart)
		highlightCart(); % подсвечиваем выбранные точки
	end
	showPointIDs(); % Выводим номера точек

	xlim(GA.XLim);
	ylim(GA.YLim);
	daspect(GA.DataAspectRatio);

	legend(sprintf('State #%d',ModelStateCounter));
	legend('Orientation','horizontal');
	legend('Location','northoutside');
	% legend('Location','northwestoutside');
end