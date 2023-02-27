function figure = STANDARDIZE_AXES(ax)

    PS = PLOT_STANDARDS();

    % Set Properties for X and Y Axis Numbers
    ax.Color = [1 1 1];
    ax.LineWidth = 0.75;
    ax.FontSize = 10;
    
    ax.FontName = PS.AxisNumbersFontName;
    
    % ax.FontSize = PS.AxisNumbersFontSize;
    ax.FontWeight = 'bold';

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
    ax.TickDir = 'out';
    ax.TickLength = [PS.AxisTickLength, PS.AxisTickLength];
    ax.XMinorTick = 'on';
    ax.YMinorTick = 'on';
    ax.ZMinorTick = 'on';
    ax.XColor = PS.AxisColor;
    ax.YColor = PS.AxisColor;
    ax.ZColor = PS.AxisColor;
    ax.XLabel.Color = PS.AxisLabelColor;
    ax.YLabel.Color = PS.AxisLabelColor;
    ax.ZLabel.Color = PS.AxisLabelColor;
    ax.LineWidth = PS.DefaultLineWidth;

end