function pickLabel(lname)
global LABELS;
global SCART;

% сначала проверим, какие метки у нас есть
for i = 1:numel(LABELS)
	kLabels{i,1} = string(LABELS(i).id);
end

% потом проверяем есть ли в известных именах lname
for i = 1:numel(kLabels)
	if checkLabel(lname)
		pickSides(LABELS(i).sides);
		fprintf('Label "%s" picked!\n', lname);
	else
		fprintf('Label "%s" not found!\n', lname);
	end
end

refreshView();

end