function h=getPlotPosition(varargin)
%GETPLOTPOSITION Returns the position of the window that is opened.
%   getPlotPosition is a tool to determine exact window coordinates so that
%   in the future you can create new plots that aren't in the default
%   Matlab position. It works with any number of monitors and any
%   arrangement.
%
%   You can force plots to display maximized on your primary or secondary
%   (or even tertiary) monitor. Any number of plots can be arranged on a
%   page using Windows "Tile" command.
%
%   Example
%   getPlotPosition
%   getPlotPosition
%   % Click Figure 1 and Ctrl-Click Figure 2. Select "Tile Vertically".
%   % Close both figures. You now have the Position coordinates to create
%   % plots that will always be displayed as such.

% Author: Jed Frey.
% Created: Sep 2008
% Copyright 2008

% Error Checking
error(nargchk(0, 2, nargin, 'struct'))
error(nargchk(0, 1, nargout, 'struct'))

% If this is not being called by the DeleteFcn callback
if numel(varargin)==0
    % Create a generic figure
    h = figure('Color',[1 1 1]);
    % Fill it with descriptive text
    annotation(h,'textbox',...
        'String',{'Position this figure on any monitor and at any size you wish (even maximized).','','When you are satisfied with the position and size of the figure, close it'},...
        'FontSize',16,...
        'FontName','Arial',...
        'FitHeightToText','off',...
        'EdgeColor',[1 1 1],...
        'Position',[0 0 1 1]);
    % Assign the callback to self.
    set(h,'DeleteFcn',@getPlotPosition);
    % Keep from dumping junk to the window.
    if nargout==1
        varargout{1}=h;
    end
else
    h=varargin{1};
    % Get the position of the plot
    position=get(h,'Position');
    % Assign the position to the base. This is so that position can be
    % called from within scripts.
    assignin('base','position',position)
    % Print how to use this information.
    fprintf('To make a plot appear in the location that you just choose.\nUse either one of the lines below. ''set'' will set the current window to the selected position\n''figure'' will create a new figure in that location.\n\n');
    fprintf('set(gcf,''Position'',[%i %i %i %i])\n\n',position(1),position(2),position(3),position(4));
    fprintf('fig=figure(''Position'',[%i %i %i %i])\n\n',position(1),position(2),position(3),position(4));
end
