function colorContour()

    global ConStruct;

    
    for i = Cart
               
    Ui = unique([ConStruct(i).Voltage]);
        if unique([ConStruct(i).Voltage]) == 0
           Ui = 1;
        end
          
       
    U = max([ConStruct.Voltage]);
        if max([ConStruct.Voltage]) == 0
           U = 1;
        end
        
    w = fix(U/Ui);
    
    W = unique([w]);
    if unique([w]) < 1
       W = 1;
    end
    
    E = fix(64/W);
    
    c = jet;
    hold on;
    plot ([ConStruct(min(Cart):max(Cart)).Z], [ConStruct(min(Cart):max(Cart)).R], ...
        'Color', c(E, :), ...
        'LineWidth', 2);
    colormap(jet);
    colorbar('Ticks',[]);
    hold off;    
    
    end
    
end