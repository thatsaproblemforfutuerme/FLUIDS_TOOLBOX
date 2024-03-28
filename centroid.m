function [AxisPosition] = centroid(func,a1,a2,Totalsteps)
%approximates position on an axis (AP) of centroid of a function from a1 to
%a2 using the right corner rule, 
%% example script input
% a1 = 0;
% a2 = 1;
% Totalsteps = 100;
% func = @(a) sqrt(1-a^2);
% [AxisPosition] = centroid(func,a1,a2,Totalsteps);
% disp(AxisPosition)
%% 
sumOne = 0;
sumTwo = 0;
StpSz = (a2-a1)/Totalsteps;%new step size that will result in an integer amount of steps being taken
for i = 1:Totalsteps
    a = a1+i*StpSz; % position a, on the a axis, at ith step
    sumOne = sumOne + a*(func(a))*StpSz;
    sumTwo = sumTwo + (func(a))*StpSz;
end
AxisPosition = sumOne/sumTwo;%top integral/bottom integral