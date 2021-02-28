function listBC()
global LABELS;
global BC;

% выводим имена существующих меток
fprintf('\nKnown BCs are:\n') % display known boundary conditions
for i = 1:numel(BC)
	for j = 1:
	kL{i,1} = LABELS(i).id; % display name of the known label
	kL{i,2} = LABELS(i).sides; % sides, which this label assigned to
end
cell2table(kL, 'VariableNames', {'id' 'sides'})
end

