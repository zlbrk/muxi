% Перерисовка рабочего вида
function refreshView()
	global PCART;
	global SCART;
	global GA;
	global RGVP;
	global ModelStateCounter;
	
	cla(); % очищаем оси
	RGVP = []; % очищаем точки визуализации (иначе их будет накапливаться очень много)
 	drawSides(); % рисуем стороны
	drawRegion(); % закращиваем регион
 	drawSides(); % рисуем стороны
	drawPoints(); % рисуем точки
	if ~isempty(PCART)
		highlightPCart(); % подсвечиваем выбранные точки, если они есть
	end
	if ~isempty(SCART)
		highlightSCart(); % подсвечиваем выбранные сегменты, если они есть
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