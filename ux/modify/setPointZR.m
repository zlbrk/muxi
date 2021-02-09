% Установить новое положение для выбранной точки
function setPointZR(Znew, Rnew)
	global PCART;
	global POINTS;

	if numel(PCART) == 1

		POINTS(PCART).Z = Znew;
		POINTS(PCART).R = Rnew;
		
	else
		if isempty(PCART)
			fprintf("PCART is empty. Nothing to move!\n");
		elseif numel(PCART) > 1
			fprintf("Setting position for several points at once doesn't permitted!\nConsider 'move up to' command, if needed\n");
		end
	end
	
	clearPCart();
	refreshView(); % Обновляем вид
end
