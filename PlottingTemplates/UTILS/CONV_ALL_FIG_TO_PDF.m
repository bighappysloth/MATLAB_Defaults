function CONV_ALL_FIG_TO_PDF()
    temp = FIND_FILES_BY_EXT('fig'); % get all .fig files
    disp(temp)
    for i=1:length(temp)
        FIG_TO_PDF(['EXP/',temp{i}]);
    end
end

