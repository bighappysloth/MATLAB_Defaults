function FIG_TO_PDF(filename)
    
    h = openfig(filename, 'new', 'invisible'); % open .fig file
    STANDARDIZE_SCOPE(h)

    print(h, [strtrim(filename(1:end - 4)) '.pdf'], '-vector', '-dpdf', '-bestfit'); % save as PDF with same name

    close(h); % close figure
end
