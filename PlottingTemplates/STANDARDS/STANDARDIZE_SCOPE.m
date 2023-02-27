function figure = STANDARDIZE_SCOPE(h)

    PS = PLOT_STANDARDS();

    % Set Properties for X and Y Axis Numbers

    set(h,'PaperPositionMode','auto'); % set paper position to match figure size

    lines = findobj(h, 'Type', 'Line');
    set(lines, 'Color', PS.tab_orange);
    set(lines, 'LineWidth', 2);

    text_objects = findall(h, 'Type', 'text');
    set(text_objects, 'Color', [0 0 0]);

    % Grab Axes from the Figure Handle.
    ax = findobj(h, 'Type', 'axes');

    ui_panel = findobj(h, 'Type', 'uipanel');
    set(ui_panel, 'BackgroundColor', [1 1 1])
    set(ui_panel, 'ForegroundColor', [1 1 1])


    ax.Color = [1 1 1];
    
    ax.FontSize = 10;
    ax.FontName = PS.AxisNumbersFontName;
    ax.FontWeight = 'normal';

    
    % Set Properties for X, Y and Z Labels
    ax.XLabel.FontName = PS.AxisFont;
    ax.YLabel.FontName = PS.AxisFont;
    ax.ZLabel.FontName = PS.AxisFont;

    ax.XLabel.FontSize = PS.AxisFontSize;
    ax.YLabel.FontSize = PS.AxisFontSize;
    ax.ZLabel.FontSize = PS.AxisFontSize;

    ax.XLabel.FontWeight = 'normal';
    ax.YLabel.FontWeight = 'normal';
    ax.ZLabel.FontWeight = 'normal';

    ax.Box = 'off';
    
    %===============================
    % Tickmarks


    ax.TickDir = 'out';
    ax.TickLength = [PS.AxisTickLength, PS.AxisTickLength];
    ax.XMinorTick = 'off';
    ax.YMinorTick = 'off';
    ax.ZMinorTick = 'off';
    
    %===============================
    % Axis Colours

    ax.XColor = PS.AxisColor;
    ax.YColor = PS.AxisColor;
    ax.ZColor = PS.AxisColor;
    
    ax.XLabel.Color = PS.AxisLabelColor;
    ax.YLabel.Color = PS.AxisLabelColor;
    ax.ZLabel.Color = PS.AxisLabelColor;
    ax.LineWidth = PS.DefaultLineWidth;

    %===============================
    % Axes Title

    ax.Title.FontName = PS.TitleFont;
    ax.Title.FontSize = PS.TitleFontSize;
    ax.Title.FontWeight = 'normal';

end