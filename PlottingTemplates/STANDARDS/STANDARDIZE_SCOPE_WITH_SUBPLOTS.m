function STANDARDIZE_SCOPE_WITH_SUBPLOTS(h)

    PS = PLOT_STANDARDS();

    % Set Properties for X and Y Axis Numbers

    set(h,'PaperPositionMode','auto'); % set paper position to match figure size

    

    % Fix Fonts
    text_objects = findall(h, 'Type', 'text');
    set(text_objects, 'Color', [0 0 0]);

    % Grab Axes from the Figure Handle.
    axes = findall(h, 'Type', 'axes');


    % Fix Panel
    ui_panel = findobj(h, 'Type', 'uipanel');
    set(ui_panel, 'BackgroundColor', [1 1 1]);
    set(ui_panel, 'ForegroundColor', [1 1 1]);


    if numel(axes)>= 1
        
        for i = 1:numel(axes)
            ax = axes(i);


            lines = findall(ax, 'Type', 'Line');
            stairs = findall(ax, 'Type', 'stair');
            
            % Checks if the current scope has stairs instead of lines.
            % This occurs when it is the output of sampling... Matlab outputs stairs instead of lines
            % Lines are responsible for peak-finder, etc.
            % More care is needed to filter out those lines, perhaps by checking the DisplayName.
            
            if numel(stairs)>=1
                line_labels = cell(numel(stairs), 1);
                for i = 1:numel(stairs)
                    id_colour = rem(i-1, numel(PS.tab_colours))+1;
                    
                    set(stairs(i), 'Color', PS.tab_colours{id_colour});
                    set(stairs(i), 'LineWidth', 1.5);
                    
                    line_labels{i} = stairs(i).DisplayName;
                    
                end
                legend(stairs, line_labels);
            else
                line_labels = cell(numel(lines), 1);
                for i = 1:numel(lines)
                    id_colour = rem(i-1, numel(PS.tab_colours))+1;
                    
                    set(lines(i), 'Color', PS.tab_colours{id_colour});
                    set(lines(i), 'LineWidth', 1.5);
                    line_labels{i} = lines(i).DisplayName;
                    
                end
                legend(lines, line_labels);
            end
            % axis('tight'); % Zoom out the plot so all data fits.
            
            
        
            % Fix Legend Font size
            legendobj = findobj(ax, 'Type', 'legend');
            set(legendobj, 'Color',     [1 1 1]);
            set(legendobj, 'TextColor', [0 0 0]);
            set(legendobj, 'FontName', PS.LegendFont);
            set(legendobj, 'FontSize', PS.LegendFontSize);
            set(legendobj, 'Interpreter', 'latex');
            
            legend('location', 'northeast');
        
        
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
        
            % xlabel('X-Axis Label', 'Units', 'normalized', 'Position', [0.5, -0.1, 0]);
            % ylabel('Y-Axis Label', 'Units', 'normalized', 'Position', [-0.1, 0.5, 0]);
        
        
            ax.Box = 'on';
            
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
    end
end