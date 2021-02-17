function listLabels()
global LABELS;

% выводим имена существующих меток
fprintf('---\nKnown labels are:\n') % display known labels
for i = 1:numel(LABELS)
	fprintf('%s\n',(LABELS(i).id)) % display known labels
end