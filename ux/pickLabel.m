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
	end
end
SCART = LABELS(lidx).sides

clearCarts();
refreshView();

end