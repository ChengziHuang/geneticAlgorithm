function data = readData(file)
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
    data = data';
end