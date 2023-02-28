function fig_files = find_files_by_ext(ext)
    dir_result = dir('EXP'); % list all files in the directory
    fig_files = {}; % initialize an empty cell array

    for i=1:length(dir_result)
        temp = dir_result(i).name;
        if length(temp) >= 4
            if strcmp(temp(end-3: end), ['.', ext])
                fig_files{end+1} = temp;
            end
        end
    end
end

