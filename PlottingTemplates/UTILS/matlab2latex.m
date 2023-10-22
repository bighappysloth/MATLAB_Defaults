function latex_matrix = matlab2latex(matrix)

% Get matrix size
[m, n] = size(matrix);

% Initialize LaTeX matrix string
latex_matrix = '\begin{bmatrix}';

% Convert matrix to LaTeX format
for i = 1:m
    for j = 1:n
        % Add matrix element to LaTeX matrix string
        latex_matrix = strcat(latex_matrix, num2str(matrix(i,j)));
        % Add matrix column separator
        if j < n
            latex_matrix = strcat(latex_matrix, ' & ');
        end
    end
    % Add matrix row separator
    if i < m
        latex_matrix = strcat(latex_matrix, ' \\ ');
    end
end

% End LaTeX matrix string
latex_matrix = strcat(latex_matrix, '\end{bmatrix}');

% Display LaTeX matrix string (disabled)
% disp(latex_matrix);

% % Open the file for writing
% fileID = fopen('fname,'w');
% 
% % Define the string to be written to the file
% 
% % Write the string to the file
% fprintf(fileID,'%s',latex_matrix);
% 
% % Close the file
% fclose(fileID);


end
