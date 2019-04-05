function [distance, num] = readData(file)
    fid = fopen(file);
    if fid == -1
        disp('File open not successful')
    else 
        aline = '';
        target = 'NODE_COORD_SECTION';
        while strcmp(aline, target) == 0
            aline = fgetl(fid);
        end
        data = fscanf(fid, '%f %f %f', [3 inf]);
    end
    
    num = length(data);
    distance = triu(zeros(num)); 
    %use upper triangular to reduce the use of memory
    for i = 1 : num
        for j = (i + 1) : num
            distance(i, j) = calculate(data, i, j);
        end
    end
end

function d = calculate(data, index1, index2)
    x1 = data(2, index1);
    y1 = data(3, index1);
    
    x2 = data(2, index2);
    y2 = data(3, index2);
    
    d = sqrt((x1 - x2)^2 + (y1 - y2)^2);
end