function [yo] = Interp(x1,x2,y1,y2,xo)
%function interpolates between two points for yo
yo = y1+((y2-y1)/(x2-x1))*(xo-x1);
end