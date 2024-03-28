function [Q] = heat(m,C,Ti,Tf)
% The amount of heat gained or lost by a sample (Q) can be calculated 
% using the equation Q = mcΔT, where m is the mass of the sample, 
% c is the specific heat, and ΔT is the temperature change.
%m[kg]
%Cv/Cp [Jkg^-1K^-1]
%Ti/Tf[K]
%Q[J]
Q = m*C*(Tf-Ti);
end