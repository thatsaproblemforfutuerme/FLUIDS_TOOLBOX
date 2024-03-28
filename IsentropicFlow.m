function [a,Pratio,Tratio,RHOratio,Aratio] = IsentropicFlow(gamma,mach,Ts,R)
%MATLAB toolbox to calculate the properties of flow undergoing an isentropic
% process. 
%% inputs
%gamma (Cp/Cv)
% Mach number(M)
% Total Pressure(Po)[Pa] 
% Total Temperature(To)[K]
% R specific constant for gas [J/kg/K]
%% outputs
% a = speed of sound[m/s]
% Pratio = static pressure/total pressure
% Tratio = static temperature/total temperature
% RHOratio = static RHO/total RHO
%% pressure ratio 
Pratio = (1 + .5*(gamma-1)*mach^2)^(-gamma/(gamma-1));
%% temperature ratio
Tratio = (1 + mach^2*(gamma-1)*.5)^-1;
 %correct
%% speed of sound
a = sqrt(gamma*R*Ts);
%% density ratio
RHOratio = (1+.5*(gamma-1)*mach^2)^(-1/(gamma-1));
%% Area ratio
K1 = (gamma+1)/2;
K2 = (-1)*(gamma+1)/(2*gamma-2);
K3 = (1+(gamma-1)*(.5)*(mach^2));
K4 = (gamma+1)/(2*gamma-2);
Aratio = (K1^K2)*(K3^K4)*(1/mach);
end