function [opt optadd] = fn4D_parseInput(varargin)
% function [optinit optadd] = ParseInput(optinit,'name','value',...)
% function opt = ParseInput('name','value',...)
%---
% optinit is a structure, but optadd/opt is a cell array
initflag = isstruct(varargin{1});
if initflag
    optinit = varargin{1};
    kstart = 2;
else
    if nargout==2
        error('default initialization options not provided')
    end
    optinit = struct;
    kstart = 1;
end
kadd = false(1,2*floor((nargin+1-kstart)/2));
for k=kstart:2:nargin-1
    f = varargin{k};
    if isfield(optinit,f)
        a = varargin{k+1};
        optinit.(f) = a;
    else
        kadd(k:k+1) = true;
    end
end
if initflag
    opt = optinit;
    optadd = varargin(kadd);
else
    opt = varargin(kadd);
end
end