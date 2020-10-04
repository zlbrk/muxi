% Перерисовка рабочего вида
function refreshView()
	global PCART;
	global SCART;
	global GA;
	global ModelStateCounter;
	
	cla(); % очищаем оси
	drawRegion(); % рисуем контур
 	refreshSides(); % Обновляем структуру сегментов
 	drawSides();
	drawPoints(); % рисуем все точки
	if ~isempty(PCART)
		highlightPCart(); % подсвечиваем выбранные точки
	end
	if ~isempty(SCART)
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