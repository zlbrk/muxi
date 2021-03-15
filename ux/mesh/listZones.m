function Z = listZones()
global ZONES;

N = numel(ZONES.ZN); % Зон по направлению Z
M = numel(ZONES.RN); % Зон по направлению R

for j = 1:M
	for i = 1:N
		ksi = i + (j-1)*N; % итератор по зонам (вытягиваем в строку)
		% Z(ksi).Z1 = ZONES.Z(i);
		% Z(ksi).Z2 = ZONES.Z(i+1);
		% Z(ksi).R1 = ZONES.R(j);
		% Z(ksi).R2 = ZONES.R(j+1);
		Z(ksi).ZN = ZONES.ZN(i);
		Z(ksi).RN = ZONES.RN(j);
		Z(ksi).txt = sprintf('%dx%d\n', Z(ksi).ZN, Z(ksi).RN);
	end
end
