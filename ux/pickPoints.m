function pickPoints(PointIds)
% добавление точек в корзину
	global PCart;
	global ConStruct;

	for i = PointIds
		if ~ismember(i, [ConStruct.id])
			fprintf('Point #%d does not exist!\n',i);
			continue
		end
		if ~ismember(i, PCart)
			PCart = [PCart i];
		else
			fprintf('Point #%d is already in the PCart!\n', i);
		end
	end

	refreshView(); % Обновляем вид
end

