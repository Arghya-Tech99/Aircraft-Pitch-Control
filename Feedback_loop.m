% Declaring the open loop Aircraft system
s = tf('s');
P_pitch = (1.151*s+0.1774)/(s^3+0.739*s^2+0.921*s);

% Adding a unity feedback loop
sys_CLOSE = feedback(P_pitch,1);

% Get the poles and zeroes of feedback system
poles = pole(sys_CLOSE)
zeros = zero(sys_CLOSE)

R = 0.2/s; % Defining the input step and its magnitude
Y = zpk(sys_CLOSE*R)

% Performnig partial fraction expansion in MATLAB
% residue function is used.
% [r,p,k] = residue(num,den)
[r,p,k] = residue(0.2*[1.151 0.1774],[1 0.739 2.072 0.1774 0])
% r - gives the numerator after expansion; is an array
% p - poles of the system; is an array

% To find the coefficients of complex conjugate pair
[num,den] = residue(r(1:2),p(1:2),k);
tf(num,den)

% From above computations, 
% A = 0.2     --> Coefficient of pole=0
% B = -0.0879 --> Coefficient of pole=-0.0881
% C = -0.1121 --> Coefficient of pole=(-0.3255 + 1.3816i) & (-0.3255 - 1.3816i)
% D = -0.08071--> Coefficient of pole=(-0.3255 + 1.3816i) & (-0.3255 - 1.3816i)

figure;
step(0.2*sys_CLOSE);
ylabel('pitch angle (rad)');
title('Closed-loop Step Response');

% The generated response demonstrates that desired requirements still not
% met.