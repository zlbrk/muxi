function savem()

prompt = 'Give me name\n';

name = input(prompt, 's');

save_txt = ['save ',name];

eval(save_txt);

move_txt = ['movefile ', name '.mat', ' ../muxi/projects'];

eval(move_txt);

fprintf('Your file save as %s \n', name);

end