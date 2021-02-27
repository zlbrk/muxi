function highlightSCart()
	global SCART;
	global SIDES;
	global COLORS;
	if ~isempty(SCART)
		for i = SCART
			drawSide(SIDES(i), COLORS.Picked, 3.5); % подсвечиваем выбранные сегменты
		end
	else
		fprintf('SCART is empty. Nothing to highlight!\n');
	end
end
