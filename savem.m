function savem()

prompt = 'Give mi name\n';

name = input(prompt, 's');

filename = strcat(name);

txt = ['save ',filename, ' name'];

eval(txt)

end