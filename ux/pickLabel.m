function pickLabel(lname)
global LABELS;
global SCART;

% проверяем есть ли в известных именах lname
for i = 1:numel(LABELS)
	[lExists, lNumber] = checkLabel(lname)
	if lExists
		pickSides(LABELS(lNumber).sides);
		fprintf('Label "%s" picked!\n', lname);
	else
		fprintf('Label "%s" not found!\n', lname);
	end
end

refreshView();

end