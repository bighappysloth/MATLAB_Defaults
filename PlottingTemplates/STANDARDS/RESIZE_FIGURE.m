function makereadable = RESIZE_FIGURE(fig, flag)

    %========================================================
    % INCLUDE PLOT_STANDARDS
    
    PS = PLOT_STANDARDS();
    
    
    %========================================================
    % GET FIGURE HANDLE
    
    

    
    %========================================================
    % DIFFERENT STYLES FOR NON-TILED VS TILED
    
    % Non-Tiled Plot
    
       
        %========================================================
        % SET WINDOW SIZE
        
        % If to save in 'big' mode
if isequal(flag, 'big')
    
    %========================================================
    % FOR 'BIG' SAVE IN 'MAXIMIZED' MODE
    fig.WindowState = 'maximized';

    
    %========================================================
    % GET CURRENT FIGURE AXES

    % get axes for current figure
    axes = findall(fig, 'Type', 'axes');
    if numel(axes)>= 1

        for i = 1:numel(axes)
            ax = axes(i);
        
        
        
            %========================================================
            % SET PROPERTIES FOR X-AXIS AND Y-AXIS
        
            % Set Properties for X and Y Axis Numbers
            ax.FontName = PS.AxisNumbersFontName;
            ax.FontSize = PS.save_big_AxisNumbersFontSize;
            ax.FontWeight = 'normal';
        
            % Set Properties for X, Y and Z Labels
            ax.XLabel.FontName = PS.AxisFont;
            ax.YLabel.FontName = PS.AxisFont;
            ax.ZLabel.FontName = PS.AxisFont;
        
            ax.XLabel.FontSize = PS.save_big_AxisFontSize;
            ax.YLabel.FontSize = PS.save_big_AxisFontSize;
            ax.ZLabel.FontSize = PS.save_big_AxisFontSize;
                    
            ax.XLabel.FontWeight = 'normal';
            ax.YLabel.FontWeight = 'normal';
            ax.ZLabel.FontWeight = 'normal';
% %         
            if length(ax.XLabel.String) > 4
                if all(ax.XLabel.String([1, 2, end - 1, end]) == '$$$$')
                    ax.XLabel.Interpreter = 'latex';
                end
            end
            if length(ax.YLabel.String) > 4
                if all(ax.YLabel.String([1, 2, end - 1, end]) == '$$$$')
                    ax.YLabel.Interpreter = 'latex';
                end
            end
            if length(ax.ZLabel.String) > 4
                if all(ax.ZLabel.String([1, 2, end - 1, end]) == '$$$$')
                    ax.ZLabel.Interpreter = 'latex';
                end
            end
            
        
            %========================================================
            % SET PROPERTIES FOR TITLE
        
            ax.Title.FontName = PS.TitleFont;
            ax.Title.FontSize = PS.save_big_TitleFontSize;
            ax.Title.FontWeight = 'normal';
            if length(ax.Title.String) > 4
                if all(ax.Title.String([1, 2, end - 1, end]) == '$$$$')
                    ax.Title.Interpreter = 'latex';
                end
            end
        
        
            %========================================================
            % SET PROPERTIES FOR LEGEND
            
            if (numel(ax.Legend) ~= 0)
                ax.Legend.FontName = PS.LegendFont;
                ax.Legend.FontSize = PS.save_big_LegendFontSize;
                for i_Legend = 1: length(ax.Legend.String)
                    if length(ax.Legend.String{i_Legend}) > 4
                        if all(ax.Legend.String{i_Legend}([1, 2, end - 1, end]) == '$$$$')
                            ax.Legend.Interpreter = 'latex';
                            break
                        end
                    end
                end
                ax.Legend.Box = 'on';
                ax.Legend.LineWidth = PS.save_big_DefaultLegendBoxLineWidth;
                ax.Legend.AutoUpdate = 'off';
            end
        
        
            %========================================================
            % SET PROPERTIES FOR CHILDREN OF AXES -> LINES, TEXT ON PLOT
        
            axisChildren = ax.Children;
            for i = 1:length(axisChildren)
                if isequal(axisChildren(i).Type, 'text')
                    axisChildren(i).FontName = PS.PlotTextFont;
                    % axisChildren(i).FontSize = PS.save_big_PlotTextFontSize;
                    if length(axisChildren(i).String) > 4
                        if all(axisChildren(i).String([1, 2, end - 1, end]) == '$$$$')
                            axisChildren(i).Interpreter = 'latex';
                        end
                    end
                end
            end
        
        
            %========================================================
            % ADJUST AXES PROPERTIES
        
            ax.Box = 'on';
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
            ax.LineWidth = PS.save_big_DefaultLineWidth;
            
        end
    end

% If to save in 'small' mode
else
    axes = findall(fig, 'Type', 'axes');
    if numel(axes)>= 1
    
    for i = 1:numel(axes)
        ax = axes(i);
    %========================================================
    % FOR 'SMALL' SAVE IN 'NORMAL' MODE
    
        fig.WindowState = 'normal';
    

    %========================================================
    % GET CURRENT FIGURE AXES

    % get axes for current figure
%     ax = fig.CurrentAxes;


        %========================================================
        % SET PROPERTIES FOR X-AXIS AND Y-AXIS
    
        % Set Properties for X and Y Axis Numbers
        ax.FontName = PS.AxisNumbersFontName;
        ax.FontSize = PS.save_small_AxisNumbersFontSize;
        ax.FontWeight = 'normal';
    
        % Set Properties for X, Y and Z Labels
        ax.XLabel.FontName = PS.AxisFont;
        ax.YLabel.FontName = PS.AxisFont;
        ax.ZLabel.FontName = PS.AxisFont;
    
        ax.XLabel.FontSize = PS.save_small_AxisFontSize;
        ax.YLabel.FontSize = PS.save_small_AxisFontSize;
        ax.ZLabel.FontSize = PS.save_small_AxisFontSize;
    
        ax.XLabel.FontWeight = 'normal';
        ax.YLabel.FontWeight = 'normal';
        ax.ZLabel.FontWeight = 'normal';
    
        if length(ax.XLabel.String) > 4
            if all(ax.XLabel.String([1, 2, end - 1, end]) == '$$$$')
                ax.XLabel.Interpreter = 'latex';
            end
        end
        if length(ax.YLabel.String) > 4
            if all(ax.YLabel.String([1, 2, end - 1, end]) == '$$$$')
                ax.YLabel.Interpreter = 'latex';
            end
        end
        if length(ax.ZLabel.String) > 4
            if all(ax.ZLabel.String([1, 2, end - 1, end]) == '$$$$')
                ax.ZLabel.Interpreter = 'latex';
            end
        end
    
    
        %========================================================
        % SET PROPERTIES FOR TITLE
    
        ax.Title.FontName = PS.TitleFont;
        ax.Title.FontSize = PS.save_small_TitleFontSize;
        ax.Title.FontWeight = 'normal';
        if length(ax.Title.String) > 4
            if all(ax.Title.String([1, 2, end - 1, end]) == '$$$$')
                ax.Title.Interpreter = 'latex';
            end
        end
    
    
        %========================================================
        % SET PROPERTIES FOR LEGEND
        
        if (numel(ax.Legend) ~= 0)
            ax.Legend.FontName = PS.LegendFont;
            ax.Legend.FontSize = PS.save_small_LegendFontSize;
            for i_Legend = 1: length(ax.Legend.String)
                if length(ax.Legend.String{i_Legend}) > 4
                    if all(ax.Legend.String{i_Legend}([1, 2, end - 1, end]) == '$$$$')
                        ax.Legend.Interpreter = 'latex';
                        break
                    end
                end
            end
            ax.Legend.Box = 'on';
            ax.Legend.LineWidth = PS.save_small_DefaultLegendBoxLineWidth;
            ax.Legend.AutoUpdate = 'off';
        end
    
    
        %========================================================
        % SET PROPERTIES FOR CHILDREN OF AXES -> LINES, TEXT ON PLOT
    
        axisChildren = ax.Children;
        for i = 1:length(axisChildren)
            if isequal(axisChildren(i).Type, 'text')
                axisChildren(i).FontName = PS.PlotTextFont;
                axisChildren(i).FontSize = PS.save_small_PlotTextFontSize;
                % axisChildren(i).FontSize = PS.save_small_PlotTextFontSize;
                if length(axisChildren(i).String) > 4
                    if all(axisChildren(i).String([1, 2, end - 1, end]) == '$$$$')
                        axisChildren(i).Interpreter = 'latex';
                    end
                end
                
            end
        end
    
    
        %========================================================
        % ADJUST AXES PROPERTIES
    
        ax.Box = 'on';
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
        ax.LineWidth = PS.save_small_DefaultLineWidth;
    
        end
    end


end
    

    %========================================================
    % SAVE THE FIGURE
%     
%     figure_resolution = PS.save_DefaultResolution;
%     exportgraphics(fig, fig_filename, 'Resolution', figure_resolution);
    
    
end