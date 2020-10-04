function pickPoints(PointIds)
% добавление точек в корзину
	global PCART;
	global POINTS;

	for i = PointIds
		if ~ismember(i, [POINTS.id])
			fprintf('Point #%d does not exist!\n',i);
			continue
		end
		if ~ismember(i, PCART)
			PCART = [PCART i];
		else
			fprintf('Point #%d is already in the PCART!\n', i);
		end
	end

	refreshView(); % Обновляем вид
end

