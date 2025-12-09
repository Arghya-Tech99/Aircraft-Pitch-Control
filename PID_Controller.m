% Defining the open loop function, OR plant function
s = tf('s');
P_pitch = (1.151*s+0.1774)/(s^3+0.739*s^2+0.921*s);

% Designing the proportional control, PI control, PID control using control
% system designer in MATLAB.
% controlSystemDesigner(P_pitch) 
% - To open the designer with the  root locus plot, open-loop Bode plot, and closed-loop step response plot