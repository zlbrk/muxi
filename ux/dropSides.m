function dropSIDES(SideIds)
% удаление сегментов из корзины
	global SCART;
	global SIDES;

	for i = SideIds
		if ~ismember(i, [SIDES.id])
			fprintf('Side #%d does not exist!\n',i);
			continue
		end
		if ~ismember(i, SCART)
			fprintf('Side #%d is not in the SCART!\n', i);
		end
		id = find(SCART==i);
		SCART(id)=[];
		if ~ismember(SIDES(i).next, SCART)
			dropPoints(SIDES(i).next);
		end
		if ~ismember(SIDES(i).prev, SCART)
			dropPoints(SIDES(i).id);
		end
	end
	
	refreshView(); % Обновляем вид
end

