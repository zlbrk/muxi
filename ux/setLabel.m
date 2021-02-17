function setLabel(lname)
global LABELS;
global SCART;
% сначала проверим, что lname - это массив символов
if ~ischar(lname)
	fprintf('Label name %s must be a character array!\n', lname)
	return
else
	[lExists, lNumber] = checkLabel(lname);
	if lExists
		LABELS(lNumber).sides = SCART;
		fprintf('Label %s already exists! Sides updated!\n', lname)
	else
		l.id = lname;
		l.sides = SCART;
		LABELS = [LABELS; l];
	end
end
clearCarts();
refreshView();

fprintf('%s\n', 'Hello from setLabel YNDX!');
end