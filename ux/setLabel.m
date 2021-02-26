function setLabel(lname)
global LABELS;
global SCART;
% сначала проверим, что lname - это массив символов
if ~ischar(lname)
	fprintf('Label name %s must be a character array!\n', lname)
	return
else
	[lExists, lNumber] = checkLabel(lname);
	if lExists && lNumber ~= 1
		LABELS(lNumber).sides = SCART;
		fprintf('Label "%s" already exists! Sides updated!\n', lname)
	elseif lExists && lNumber == 1
		fprintf('Label "%s" is protected!\nYou can not use this name!\n', lname)
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