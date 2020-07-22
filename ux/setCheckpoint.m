function setCheckpoint()
global ConStruct
global Colors

filename = ['temp/checkpoint'];

save(filename, 'ConStruct', 'Colors');

fprintf("Checkpoint successfully created!\n");

end