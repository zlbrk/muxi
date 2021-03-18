function ZNS = listZones()
global ZONES;

N = numel(ZONES.ZN); % Зон по направлению Z
M = numel(ZONES.RN); % Зон по направлению R

for j = 1:M
	for i = 1:N
		ksi = i + (j-1)*N; % итератор по зонам (вытягиваем в строку)
		ZNS(ksi).Z1 = ZONES.Z(i);
		ZNS(ksi).Z2 = ZONES.Z(i+1);
		ZNS(ksi).R1 = ZONES.R(j);
		ZNS(ksi).R2 = ZONES.R(j+1);
		ZNS(ksi).ZN = ZONES.ZN(i);
		ZNS(ksi).RN = ZONES.RN(j);
		ZNS(ksi).txt = sprintf('%dx%d\n', ZNS(ksi).ZN, ZNS(ksi).RN);
	end
end
cmap = colormap(summer(N*M))
for ksi = 1:N*M
	Z1 = ZNS(ksi).Z1;
	Z2 = ZNS(ksi).Z2;
	R1 = ZNS(ksi).R1;
	R2 = ZNS(ksi).R2;
	ZZ = [Z1 Z2 Z2 Z1];
	RR = [R1 R1 R2 R2];
	hold on; 
	patch(ZZ,RR,cmap(ksi),...
		'FaceColor','flat',...
		'FaceAlpha',.25);
	text((Z1+Z2)/2, (R1+R2)/2, ZNS(ksi).txt,...
	  'horizontalAlignment', 'center',...
	  'verticalAlignment', 'middle')
	hold off
end
