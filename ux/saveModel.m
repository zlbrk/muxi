function saveModel(filename)
global ConStruct
global Colors

filename = ['saves/' filename];

save(filename, 'ConStruct', 'Colors');

fprintf('Your file saved as "%s.mat"\nin "muxi/saves/" subfolder \n', filename);

end