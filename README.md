matlab_getPosition
==================
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
