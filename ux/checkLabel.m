function [labelExists, labelNumber] = checkLabel(lname)
global LABELS;

% сначала создадим массив с именами существующих меток
for i = 1:numel(LABELS)
	kLabels{i,1} = (LABELS(i).id); % known labels
end

if ismember(lname, kLabels)
	[~, Locb] = ismember(lname, kLabels);
	labelExists = true;
	labelNumber = nonzeros(Locb);
else
	labelExists = false;
	labelNumber = numel(LABELS)+1;
end