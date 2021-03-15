function pickLabel(lname)
global LABELS;
global SCART;

% проверяем есть ли в известных именах lname
for i = 1:numel(LABELS)
	[lExists, lNumber] = checkLabel(lname);
	if lExists && i == lNumber
		pickSides(LABELS(lNumber).sides);
		fprintf('Label "%s" picked!\n', lname);
	elseif ~lExists
		fprintf('Label "%s" not found!\n', lname);
	end
end

end