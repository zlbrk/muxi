function pickSides(SideIds)
% добавление точек в корзину
	global SCART;
	global PCART;
	global SIDES;

	for i = SideIds
		if ~ismember(i, [SIDES.id])
			fprintf('Side #%d does not exist!\n',i);
			continue
		end
		if ~ismember(i, SCART)
			SCART = [SCART i];
		else
			fprintf('Side #%d is already in the SCART!\n', i);
		end
		if ~ismember(SIDES(i).SP, PCART)
			pickPoints(SIDES(i).SP); % выбираем начальную точку сегмента
		end

		if ~ismember(SIDES(i).EP, PCART)
			pickPoints(SIDES(i).EP); % выбираем конечную точку сегмента
		end
	end

	refreshView(); % Обновляем вид
end

