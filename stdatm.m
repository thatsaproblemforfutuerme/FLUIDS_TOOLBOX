function[T, P, RHO] = stdatm(h)
% script will index all beginning and ending points
% of gradients and isotherms, as well as 
%initial height(h1), initial tempature (t1), inital pressure(p1), initial density(roh1), and lapse rate(ag).
%Then, based on inital height input, script will calculate
%the tempature(t), pressure(p), and density(rho) associated with the values given above.


g = 9.81; %setting constants to variables
R = 287;


% *note* no value calculations below sea level
%(t1),(p1),(rho1),(an)
%all vars ex: t1, p1,... will index s.t. values start at sea level and
%progress toward higher altitudes i.e
%     h=0    h=11     h=25..

t1 = [288.16, 216.66, 216.66, 282.66, 282.66, 165.66, 165.66, 205.66]; %K
p1 = [101.325, 22.6272, 2.48732693, 0.120329049459964, 0.058260056021226, 0.001007831964214, 1.042367569066992e-04, 1.642921245541477e-05];%kPa
rho1 = [1.225, 0.3638, 0.03999122, 0.001482916342896, 7.179877976237033e-04, 2.119244141767693e-05, 2.191864757967525e-06, 2.782770779370258e-07]; %kg/m^3%kg/m^3
ag = [-6.5e-3, 0, 3e-3, 0, -4.5e-3, 0, 4e-3];% lapse rate for gradient layers, 0's allow for counter function to work
% for every other gradient layer, *****TRY TO ADD +3 PER COUNT 

%h = 25001; %USER INPUT HEIGHT IN METERS

%if statements, if statments will take a height and if it satisfies
%inequality, script will perform operation for temp, then use temp in
%following density and pressure calcs
n = 1; %sets counter = 1 for generality of function
%varn = nth input of variable array
if  h < 11000

%MATH FOR ARBITRARY GRADIENT LAYER

    hn = 0; %initial height of atmosphere layer
    tn = t1(n);%takes nth input from tempature array
    pn = p1(n);%takes nth input from pressure array
    rhon = rho1(n);%takes nth input from density array
    an = ag(n);%takes nth input from lapse rate array

    T = tn + an*(h - hn);%calculates temp at user input height
    P = pn * (T/tn)^(-g/(an*R));%calculates pressure at temp found above
    RHO = rhon * (T/tn)^(-(g/(an*R) + 1));%calculates density at temp found above
    % disp(" Tempature " + T)% displays variables at user input height
    % disp(" Pressure " + P)
    % disp(" Density " + RHO)

elseif 11000 <= h && h < 25000
n = n+1; %sets counter 1 higher, describing

%MATH FOR ARBITRARY ISOTHERMAL LAYER

    hn = 11000; %initial height of atmosphere layer
    tn = t1(n);%takes th input from tempature array
    pn = p1(n);%takes th input from pressure array
    rhon = rho1(n);%takes th input from density array

    T = tn;% sets display temp to temp associated with height
    P = pn * exp((-g/(R*T))*(h-hn));
    RHO = rhon * exp((-g/(R*T))*(h-hn));
    % disp(" Tempature " + T)% displays variables at user input height
    % disp(" Pressure " + P)
    % disp(" Density " + RHO)

elseif 25000 <= h && h < 47000

%MATH FOR ARBITRARY GRADIENT LAYER
n = n + 2;
    hn = 25000; %initial height of atmosphere layer
    tn = t1(n);%takes nth input from tempature array
    pn = p1(n);%takes nth input from pressure array
    rhon = rho1(n);%takes nth input from density array
    an = ag(n);%takes nth input from lapse rate array
    
    T = tn + an*(h - hn);%calculates temp at user input height
    P = pn * (T/tn)^(-g/(an*R));%calculates pressure at temp found above
    RHO = rhon * (T/tn)^(-(g/(an*R) + 1));%calculates density at temp found above
    % disp(" Tempature " + T)% displays variables at user input height
    % disp(" Pressure " + P)
    % disp(" Density " + RHO)
elseif 47000 <= h && h < 53000
    n = n + 3;
    %MATH FOR ARBITRARY ISOTHERMAL LAYER

    hn = 47000; %initial height of atmosphere layer
    tn = t1(n);%takes th input from tempature array
    pn = p1(n);%takes th input from pressure array
    rhon = rho1(n);%takes th input from density array

    T = tn;% sets display temp to temp associated with height
    P = pn * exp((-g/(R*T))*(h-hn));
    RHO = rhon * exp((-g/(R*T))*(h-hn));
    % disp(" Tempature " + T)% displays variables at user input height
    % disp(" Pressure " + P)
    % disp(" Density " + RHO)
elseif 53000 <= h && h < 79000
    %MATH FOR ARBITRARY GRADIENT LAYER
n = n + 4;
    hn = 53000; %initial height of atmosphere layer
    tn = t1(n);%takes nth input from tempature array
    pn = p1(n);%takes nth input from pressure array
    rhon = rho1(n);%takes nth input from density array
    an = ag(n);%takes nth input from lapse rate array

    T = tn + an*(h - hn);%calculates temp at user input height
    P = pn * (T/tn)^(-g/(an*R));%calculates pressure at temp found above
    RHO = rhon * (T/tn)^(-(g/(an*R) - 1));%calculates density at temp found above
    % disp(" Tempature " + T)% displays variables at user input height
    % disp(" Pressure " + P)
    % disp(" Density " + RHO)
elseif 79000 <= h && h < 90000
    n = n + 5;
    %MATH FOR ARBITRARY ISOTHERMAL LAYER



    hn = 79000; %initial height of atmosphere layer
    tn = t1(n);%takes th input from tempature array
    pn = p1(n);%takes th input from pressure array
    rhon = rho1(n);%takes th input from density array

    T = tn;% sets display temp to temp associated with height
    P = pn * exp((-g/(R*T))*(h-hn));
    RHO = rhon * exp((-g/(R*T))*(h-hn));
    % disp(" Tempature " + T)% displays variables at user input height
    % disp(" Pressure " + P)
    % disp(" Density " + RHO)
elseif 90000 <= h
    %MATH FOR ARBITRARY GRADIENT LAYER
n = n + 6;
    hn = 90000; %initial height of atmosphere layer
    tn = t1(n);%takes nth input from tempature array
    pn = p1(n);%takes nth input from pressure array
    rhon = rho1(n);%takes nth input from density array
    an = ag(n);%takes nth input from lapse rate array

    T = tn + an*(h - hn);%calculates temp at user input height
    P = pn * (T/tn)^(-g/(an*R));%calculates pressure at temp found above
    RHO = rhon * (T/tn)^(-(g/(an*R) + 1));%calculates density at temp found above
    % disp(" Tempature " + T)% displays variables at user input height
    % disp(" Pressure " + P)
    % disp(" Density " + RHO)


end

(h);
% script will index all beginning and ending points
% of gradients and isotherms, as well as 
%initial height(h1), initial tempature (t1), inital pressure(p1), initial density(roh1), and lapse rate(ag).
%Then, based on inital height input, script will calculate
%the tempature(t), pressure(p), and density(rho) associated with the values given above.


g = 9.81; %setting constants to variables
R = 287;


% *note* no value calculations below sea level
%(t1),(p1),(rho1),(an)
%all vars ex: t1, p1,... will index s.t. values start at sea level and
%progress toward higher altitudes i.e
%     h=0    h=11     h=25..

t1 = [288.16, 216.66, 216.66, 282.66, 282.66, 165.66, 165.66, 205.66]; %K
p1 = [101.325, 22.6272, 2.48732693, 0.120329049459964, 0.058260056021226, 0.001007831964214, 1.042367569066992e-04, 1.642921245541477e-05];%kPa
rho1 = [1.225, 0.3638, 0.03999122, 0.001482916342896, 7.179877976237033e-04, 2.119244141767693e-05, 2.191864757967525e-06, 2.782770779370258e-07]; %kg/m^3%kg/m^3
ag = [-6.5e-3, 0, 3e-3, 0, -4.5e-3, 0, 4e-3];% lapse rate for gradient layers, 0's allow for counter function to work
% for every other gradient layer, *****TRY TO ADD +3 PER COUNT 

%h = 25001; %USER INPUT HEIGHT IN METERS

%if statements, if statments will take a height and if it satisfies
%inequality, script will perform operation for temp, then use temp in
%following density and pressure calcs
n = 1; %sets counter = 1 for generality of function
%varn = nth input of variable array
if  h < 11000

%MATH FOR ARBITRARY GRADIENT LAYER

    hn = 0; %initial height of atmosphere layer
    tn = t1(n);%takes nth input from tempature array
    pn = p1(n);%takes nth input from pressure array
    rhon = rho1(n);%takes nth input from density array
    an = ag(n);%takes nth input from lapse rate array

    T = tn + an*(h - hn);%calculates temp at user input height
    P = pn * (T/tn)^(-g/(an*R));%calculates pressure at temp found above
    RHO = rhon * (T/tn)^(-(g/(an*R) + 1));%calculates density at temp found above
    % disp(" Tempature " + T)% displays variables at user input height
    % disp(" Pressure " + P)
    % disp(" Density " + RHO)

elseif 11000 <= h && h < 25000
n = n+1; %sets counter 1 higher, describing

%MATH FOR ARBITRARY ISOTHERMAL LAYER

    hn = 11000; %initial height of atmosphere layer
    tn = t1(n);%takes th input from tempature array
    pn = p1(n);%takes th input from pressure array
    rhon = rho1(n);%takes th input from density array

    T = tn;% sets display temp to temp associated with height
    P = pn * exp((-g/(R*T))*(h-hn));
    RHO = rhon * exp((-g/(R*T))*(h-hn));
    % disp(" Tempature " + T)% displays variables at user input height
    % disp(" Pressure " + P)
    % disp(" Density " + RHO)

elseif 25000 <= h && h < 47000

%MATH FOR ARBITRARY GRADIENT LAYER
n = n + 2;
    hn = 25000; %initial height of atmosphere layer
    tn = t1(n);%takes nth input from tempature array
    pn = p1(n);%takes nth input from pressure array
    rhon = rho1(n);%takes nth input from density array
    an = ag(n);%takes nth input from lapse rate array
    
    T = tn + an*(h - hn);%calculates temp at user input height
    P = pn * (T/tn)^(-g/(an*R));%calculates pressure at temp found above
    RHO = rhon * (T/tn)^(-(g/(an*R) + 1));%calculates density at temp found above
    % disp(" Tempature " + T)% displays variables at user input height
    % disp(" Pressure " + P)
    % disp(" Density " + RHO)
elseif 47000 <= h && h < 53000
    n = n + 3;
    %MATH FOR ARBITRARY ISOTHERMAL LAYER

    hn = 47000; %initial height of atmosphere layer
    tn = t1(n);%takes th input from tempature array
    pn = p1(n);%takes th input from pressure array
    rhon = rho1(n);%takes th input from density array

    T = tn;% sets display temp to temp associated with height
    P = pn * exp((-g/(R*T))*(h-hn));
    RHO = rhon * exp((-g/(R*T))*(h-hn));
    % disp(" Tempature " + T)% displays variables at user input height
    % disp(" Pressure " + P)
    % disp(" Density " + RHO)
elseif 53000 <= h && h < 79000
    %MATH FOR ARBITRARY GRADIENT LAYER
n = n + 4;
    hn = 53000; %initial height of atmosphere layer
    tn = t1(n);%takes nth input from tempature array
    pn = p1(n);%takes nth input from pressure array
    rhon = rho1(n);%takes nth input from density array
    an = ag(n);%takes nth input from lapse rate array

    T = tn + an*(h - hn);%calculates temp at user input height
    P = pn * (T/tn)^(-g/(an*R));%calculates pressure at temp found above
    RHO = rhon * (T/tn)^(-(g/(an*R) - 1));%calculates density at temp found above
    % disp(" Tempature " + T)% displays variables at user input height
    % disp(" Pressure " + P)
    % disp(" Density " + RHO)
elseif 79000 <= h && h < 90000
    n = n + 5;
    %MATH FOR ARBITRARY ISOTHERMAL LAYER



    hn = 79000; %initial height of atmosphere layer
    tn = t1(n);%takes th input from tempature array
    pn = p1(n);%takes th input from pressure array
    rhon = rho1(n);%takes th input from density array

    T = tn;% sets display temp to temp associated with height
    P = pn * exp((-g/(R*T))*(h-hn));
    RHO = rhon * exp((-g/(R*T))*(h-hn));
    % disp(" Tempature " + T)% displays variables at user input height
    % disp(" Pressure " + P)
    % disp(" Density " + RHO)
elseif 90000 <= h
    %MATH FOR ARBITRARY GRADIENT LAYER
n = n + 6;
    hn = 90000; %initial height of atmosphere layer
    tn = t1(n);%takes nth input from tempature array
    pn = p1(n);%takes nth input from pressure array
    rhon = rho1(n);%takes nth input from density array
    an = ag(n);%takes nth input from lapse rate array

    T = tn + an*(h - hn);%calculates temp at user input height
    P = pn * (T/tn)^(-g/(an*R));%calculates pressure at temp found above
    RHO = rhon * (T/tn)^(-(g/(an*R) + 1));%calculates density at temp found above
    % disp(" Tempature " + T)% displays variables at user input height
    % disp(" Pressure " + P)
    % disp(" Density " + RHO)


end