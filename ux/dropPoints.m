function dropPoints_(PointIds)
% удаление точек из корзины
	global Cart;
	global ConStruct;

	for i = PointIds
		if ~ismember(i, [ConStruct.id])
			fprintf('Point #%d does not exist!\n',i);
			continue
		end
		if ~ismember(i, Cart)
			fprintf('Point #%d is not in the Cart!\n', i);
		end
		id = find(Cart==i);
		Cart(id)=[];
	end
	
	refreshView(); % Обновляем вид
end

