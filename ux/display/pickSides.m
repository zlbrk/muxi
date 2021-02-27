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
		if  ismember(i, SCART)
			fprintf('Side #%d is already in the SCART!\n', i);
			continue
		end
		
		if i == 1 
			fprintf('You cant''t pick side #%d!\n', i);
			continue
		end
		
		if i == 2
			SCART = [SCART i];
			checkPickedPoint(SIDES(i).EP);
			continue

				
		elseif i == numel([SIDES.id])
			SCART = [SCART i];
			checkPickedPoint(SIDES(i).SP);
			continue
		
		else 
			SCART = [SCART i];
			checkPickedPoint(SIDES(i).SP);
			checkPickedPoint(SIDES(i).EP);
		end
	end

	refreshView(); % Обновляем вид
end

