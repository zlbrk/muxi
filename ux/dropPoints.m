function dropPoints_(PointIds)
% удаление точек из корзины
	global PCart;
	global ConStruct;

	for i = PointIds
		if ~ismember(i, [ConStruct.id])
			fprintf('Point #%d does not exist!\n',i);
			continue
		end
		if ~ismember(i, PCart)
			fprintf('Point #%d is not in the PCart!\n', i);
		end
		id = find(PCart==i);
		PCart(id)=[];
	end
	
	refreshView(); % Обновляем вид
end

