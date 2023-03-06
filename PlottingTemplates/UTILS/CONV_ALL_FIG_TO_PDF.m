function CONV_ALL_FIG_TO_PDF(dir_name)
    % Converts all .fig files inside dir_name.
    % Example: CONV_ALL_FIG_TO_PDF('./')
    temp = FIND_FILES_BY_EXT('fig', dir_name); % get all .fig files
    disp(temp)
    for i=1:length(temp)
        FIG_TO_PDF([dir_name,temp{i}]);
    end
end

