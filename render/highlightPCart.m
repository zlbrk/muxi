function highlightPCART()
	global PCART;
	global POINTS;
	global COLORS;
	if ~isempty(PCART)
		for i = PCART
			drawPoint(POINTS(i), 's', COLORS.Picked, 16); % подсвечиваем выбранные точки
		end
	else
		fprintf('PCART is empty. Nothing to highlight!\n');
	end
end
