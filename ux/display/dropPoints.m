function dropPoints_(PointIds)
% удаление точек из корзины
	global PCART;
	global POINTS;

	for i = PointIds
		if ~ismember(i, [POINTS.id])
			fprintf('Point #%d does not exist!\n',i);
			continue
		end
		if ~ismember(i, PCART)
			fprintf('Point #%d is not in the PCART!\n', i);
		end
		id = find(PCART==i);
		PCART(id)=[];
	end
	
	refreshView(); % Обновляем вид
end

