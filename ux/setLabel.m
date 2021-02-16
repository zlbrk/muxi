function setLabel(lname)
global LABELS;
global SCART;
% сначала проверим, что lname - это массив символов
if ~ischar(lname)
	fprintf('Label name %s must be a character array!\n', lname)
	return
elseif checkLabel(lname)
	l.id = lname;
	l.sides = SCART;
	LABELS = [LABELS; l];
end
clearCarts();
refreshView();

fprintf('%s\n', 'Hello from setLabel YNDX!');
end