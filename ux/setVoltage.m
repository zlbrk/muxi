function setVoltage(V)

    global ConStruct;
    global Cart;
    
    for i = Cart;
        
        %if Cart == [3:6];
         %  fprintf('Hello!\n');
        %else
        ConStruct(i).Phi = V;
        %end
        hold on;
        plot ([ConStruct(min(Cart):max(Cart)).Z], [ConStruct(min(Cart):max(Cart)).R], 'g');
        hold off;
        
    end
end