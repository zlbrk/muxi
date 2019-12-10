function showBC()
    global ConStruct;

    CW = 64; % color width
    c = jet(CW);
        
    uPhi = unique([ConStruct.Phi]); % Ищем уникальные значения Phi
    
    for i = 1:numel(uPhi)
        Eids = find([ConStruct.Phi] == uPhi(i)); % Ищем индексы электродов
        Ecol = fix(uPhi(i)*CW); % Вычисляем номер цвета i-го электрода
        if Ecol == 0
            Ecol = 1;
        end
        colorContour(Eids, Ecol, c);
    end
    drawPoints();
    showPointIDs();
    
end

function colorContour(Eids, Ecol, c)
    global ConStruct;
    hold on;
    plot ([ConStruct(Eids).Z],... 
          [ConStruct(Eids).R],...
          'Color', c(Ecol, :),...
          'LineWidth', 2);
    colormap(jet);
    colorbar('Ticks',[]);
    hold off;
end
