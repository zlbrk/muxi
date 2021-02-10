function setLabel(lname)
global LABELS;
global SCART;

% сначала проверим, что lname - это массив символов
if ~ischar(lname)
	fprintf('Label name %s must be a character array!\n', lname)
	return
else
	l.id = lname;
	l.sides = SCART;
	LABELS = [LABELS; l];
end
clearCarts();
refreshView();

end