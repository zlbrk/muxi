function saveModel(filename)
global POINTS
global SIDES 
global LABELS 
global BC 
global ZONES 

% Будем проще. Сохраняем точки и стороны

filename = ['saves/' filename];

save(filename, 'POINTS', 'SIDES', 'LABELS', 'BC', 'ZONES');

fprintf('Your file saved as "%s.mat"\nin "muxi/saves/" subfolder \n', filename);

end