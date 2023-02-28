function FIG_TO_PDF(filename)
    
    h = openfig(filename, 'new', 'invisible'); % open .fig file
    STANDARDIZE_SCOPE(h)

    print(h, [filename '.pdf'], '-vector', '-dpdf', '-bestfit'); % save as PDF with same name

    close(h); % close figure
end
