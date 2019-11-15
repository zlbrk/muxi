function showPointIDs()
	global ConStruct;
	global Colors;

	for i = 1:numel(ConStruct)
		if ConStruct(i).id>99
			fsize = 8;
		else
			fsize = 11;
		end
		text(ConStruct(i).Z, ConStruct(i).R, num2str(ConStruct(i).id),...
		 'Color', Colors.PointIDs,...
		 'FontName', 'Consolas',...
		 'FontWeight', 'bold',...
		 'FontSize', fsize,...
		 'HorizontalAlignment','center');	
	end	
end

