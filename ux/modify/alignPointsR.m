% Выровнять R-координаты выбранных точек по точке с определённым номером 
function alignPointsR(AlignPointId)
	global PCART;
	global POINTS;

	if ~isempty(PCART)
		for i = PCART
			POINTS(i).Z = POINTS(i).Z;
			POINTS(i).R = POINTS(AlignPointId).R;
		end
	else
		fprintf('PCART is empty. Nothing to move!\n');
	end
		
	refreshView(); % Обновляем вид
end
