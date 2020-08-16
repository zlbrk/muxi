function pickSides(SideIds)
% добавление точек в корзину
	global SCart;
	global PCart;
	global Sides;

	for i = SideIds
		if ~ismember(i, [Sides.id])
			fprintf('Side #%d does not exist!\n',i);
			continue
		end
		if ~ismember(i, SCart)
			SCart = [SCart i];
		else
			fprintf('Side #%d is already in the SCart!\n', i);
		end
		if ~ismember(Sides(i).SP, PCart)
			pickPoints(Sides(i).SP); % выбираем начальную точку сегмента
		end

		if ~ismember(Sides(i).EP, PCart)
			pickPoints(Sides(i).EP); % выбираем конечную точку сегмента
		end
	end

	refreshView(); % Обновляем вид
end

