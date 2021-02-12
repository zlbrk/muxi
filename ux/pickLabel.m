function pickLabel(lname)
global LABELS;
global SCART;

% сначала проверим, акие метки у нас есть

for i = 1:numel(LABELS)
	kLabels{i,1} = string(LABELS(i).id);
end
for i = 1:numel(kLabels)
	if string(kLabels{i,1})==string(lname)
		lidx = i;
		pickSides(LABELS(lidx).sides);
		fprintf('Label "%s" picked!\n', lname);
	end
end
if isempty(lidx)
	fprintf('Label "%s" not found!\n', lname);
end


refreshView();

end