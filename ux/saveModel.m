function saveModel(filename)
global ConStruct
global Colors 
% TODO нужно сделать отдельную структуру, в которой будут 
% храниться все настройки, и сохранять её, а не только табличку с цветами.
% Пока необходимости в этом нет.

filename = ['saves/' filename];

save(filename, 'ConStruct', 'Colors');

fprintf('Your file saved as "%s.mat"\nin "muxi/saves/" subfolder \n', filename);

end