function [viscosity] = viscositySutherlandsLaw(muREF,tREF,sAIR,temp)
%sutherlands law
%muREF[Pa*s]
%tREF[K]
%sAIR[K]
%temp[K]
m = (temp/tREF)^1.5;
viscosity=(muREF)*m*((tREF+sAIR)/(temp+sAIR));

end