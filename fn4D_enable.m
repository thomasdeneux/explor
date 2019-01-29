function fn4D_enable(varargin)
%function fn4D_enable(['on|off',]varargin)
%---
% enable a list of event and handle listeners

if ischar(varargin{1})
    b = strcmp(varargin{1},'on');
    varargin = varargin(2:end);
else
    b = true;
end
for k=1:length(varargin)
    hl = varargin{k};
    switch class(hl)
        case {'event.listener','event.proplistener'}
            varargin{k}.Enabled = b;
        case 'handle.listener'
            set(hl,'enabled',fn_switch(b,'on','off'))
        otherwise
            error('object to enable/disable must be of class event.listener, event.proplistener or handle.listener')
    end
end
