function drawRegion()
	global RGVP;
	global COLORS;
	hold on
	fill(RGVP(:,1), RGVP(:,2), COLORS.Void);
	hold off;
end
