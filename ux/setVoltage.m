function setVoltage(V)
    global ConStruct;
    global Cart;
    
    for i = Cart;
        
        %if Cart == [3:6];
         %  fprintf('Hello!\n');
        %else
        ConStruct(i).Voltage = V;

        %end
        % hold on;
        % plot ([ConStruct(min(Cart):max(Cart)).Z], [ConStruct(min(Cart):max(Cart)).R], 'g');
        % hold off;
        
    end

    U0 = max([ConStruct.Voltage]); % Берём максимальное значение напряжения из доступных
    setPhi(U0);
end

function setPhi(U0)
    global ConStruct;

    for i = 1:numel(ConStruct)
        ConStruct(i).Phi = ConStruct(i).Voltage/U0;
    end
end