function saveModel(filename)
global POINTS
global SIDES 
% Будем проще. Сохраняем точки и стороны

filename = ['saves/' filename];

save(filename, 'POINTS', 'SIDES');

fprintf('Your file saved as "%s.mat"\nin "muxi/saves/" subfolder \n', filename);

end