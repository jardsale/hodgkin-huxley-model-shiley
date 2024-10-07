% HH parameters.m

% Parameters for Hodgkin-Huxley equations
clear
gbar_K  =  36;      % Maximal potassium conductance =  36   mS/cm^2
gbar_Na = 120;      % Maximal sodium    conductance = 120   mS/cm^2
gL      =   0.3;    % Constant leakage  conductance =   0.3 mS/cm2

EK =  -12;      % Potassium channel reversal potential =  -12 mV
ENa = 115;      % Sodium    channel reversal potential = +115 mV
EL =   10.613;  % Leakage potential (to make eqs self constant) 10.613 mV

% Membrane capacitance
C = 1;          % Membrane capacitance is assumed to be 1 uF/cm^2

simT = 500;                  % simulation time: ms
step = 0.001;                % sampling time set to 1 us

% Step time
step_start = 10; % step starts
step_len = 490; % step length
indx_start = step_start/step;
indx_end = indx_start + step_len/step;

time = 0:step:simT;  % Transpose to make it a column vector

% Applied input current (in uA/cm^2)
Amp = 6.3;  
% Amp = 50;
% Input current is created with two step function inputs in simulink
% Applied input current (in uA/cm^2)
I_app = zeros(size(time));
I_app = [time' I_app'];
I_app(indx_start:indx_end,2) = Amp;

% Figure out initial conditions for n, m, and h
% These should be n(infinity) evaluated at V=0.
% Remember that the resting potential of the membrane has been shifted to 0
alphan0 = 0.01*10/(exp(1)-1);
betan0  = 0.125;
ninf0 = alphan0/(alphan0+betan0);

alpham0 = 0.1*25/(exp(2.5)-1);
betam0  = 4;
minf0 = alpham0/(alpham0+betam0);

alphah0 = 0.07;
betah0  = 1/(1+exp(3));
hinf0 = alphah0/(alphah0+betah0);

% ninf0 = 0.318;
% minfo = 0.053;
% hinfo = 0.596;