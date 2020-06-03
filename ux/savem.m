function savem()
global ConStruct
global Colors

prompt = 'Give me the name\n';

filename = input(prompt, 's');

% save_str = ['save ' filename];

eval(sprintf('save %s ConStruct Colors',filename));

% move_str = ['movefile ' filename '.mat' ' ./io'];

eval(sprintf('movefile %s.mat ./saves', filename));

fprintf('Your file saved as "%s.mat"\nin "muxi/saves/" subfolder \n', filename);

end