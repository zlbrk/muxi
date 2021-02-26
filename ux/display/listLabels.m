function kLT = listLabels()
global LABELS;

% выводим имена существующих меток
fprintf('\nKnown labels are:\n') % display known labels
for i = 1:numel(LABELS)
	kL{i,1} = LABELS(i).id; % display name of the known label
	str = sprintf('%s ',string(LABELS(i).sides));
	kL{i,2} = str(1:end-1); % sides, which this label assigned to
end
kLT = cell2table(kL, 'VariableNames', {'label' 'sides'});