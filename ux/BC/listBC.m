function sSpec = listBC()
global SIDES;

% выводим имена существующих меток
fprintf('\nBoundary conditions are:\n') % display known boundary conditions
for i = 1:numel(SIDES)
	% fprintf('Side #%d\n',i);
	[sSpec{i,1}, sSpec{i,2}, sSpec{i,3}, sSpec{i,4}] = checkSide(SIDES(i)); % make side specification to list
end
disp(cell2table(sSpec, 'VariableNames', {'Side'  'Type' 'Value' 'Label'}))
end

function [sId, bcType, bcValue, sLb] = checkSide(s)
global LABELS;
global BC;
	sId = s.id;
	for i = 1:numel(LABELS)
		if ismember(sId, LABELS(i).sides)
			sLb = LABELS(i).id;
			break
		else
			sLb = 'nil';
		end
	end

	for i=1:numel(BC)
		if ismember(sId, BC(i).sides)
			bcType = BC(i).bcType;
			bcValue = BC(i).bcValue;
			break
		else
			bcType = 'nil';
			bcValue = 'nil';
		end
	end

	sSpec = {sId, bcType, bcValue, sLb}; % side specificacion

end