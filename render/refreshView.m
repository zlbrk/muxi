% Перерисовка рабочего вида
function refreshView()
	global PCart;
	global SCart;
	global GA;
	global ModelStateCounter;
	
	cla(); % очищаем оси
	drawVoid(); % рисуем контур
 	showBC(); % отображаем граничные условия
	drawCathode(); % рисуем катод
	drawPoints(); % рисуем все точки
	if ~isempty(PCart)
		highlightPCart(); % подсвечиваем выбранные точки
	end
	if ~isempty(SCart)
		highlightSCart(); % подсвечиваем выбранные сегменты
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