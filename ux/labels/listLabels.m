function varargout = listLabels()
global LABELS;

% выводим имена существующих меток
for i = 1:numel(LABELS)
	kL{i,1} = LABELS(i).id; % display name of the known label
	str = sprintf('%s ',string(LABELS(i).sides));
	kL{i,2} = str(1:end-1); % sides, which this label assigned to
end
varargout{1} = cell2table(kL, 'VariableNames', {'label' 'sides'})
fprintf('\nKnown labels stored in  table!\n') % display known labels