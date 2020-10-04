% Выровнять Z-координаты выбранных точек по точке с определённым номером 
function alignPointsZ(AlignPointId)
	global PCART;
	global POINTS;

	if ~isempty(PCART)
		for i = PCART
			POINTS(i).Z = POINTS(AlignPointId).Z;
			POINTS(i).R = POINTS(i).R;
		end
	else
		fprintf('PCART is empty. Nothing to move!\n');
	end

	setCheckpoint(); % Создаём чекпойнт
	refreshView(); % Обновляем вид
end
