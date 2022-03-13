function [data_table] = read_fcsv(filename)

    %--- Import the data
    fileID = fopen(filename);
    data = textscan(fileID,'%s %f %f %f %f %f %f %f %f %f %f %s %s %s', 'Delimiter', ',','headerLines', 3, 'CollectOutput', 1);
    
    %--- Create table
    data_table = table;

    %--- Check coordinate system
    r = importdata(filename);

    if contains(r{2},'LPS')== 1 || contains(r{2},'1')== 1
         %--- Allocate imported array to column variable names
        data_table.X = data{1,2}(:,1).*-1;
        data_table.Y = data{1,2}(:,2).*-1;
    else
         %--- Allocate imported array to column variable names
        data_table.X = data{1,2}(:,1);
        data_table.Y = data{1,2}(:,2);
    end

    %--- Allocate imported array to column variable names
    data_table.Z = data{1,2}(:,3);
    data_table.name = convertCharsToStrings(data{1,3}(:,1));
    data_table.description = convertCharsToStrings(data{1,3}(:,2));

end
