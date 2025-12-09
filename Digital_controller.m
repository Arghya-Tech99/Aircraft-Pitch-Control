% Declaring the open loop system
s = tf('s');
P_pitch = (1.151*s+0.1774)/(s^3+0.739*s^2+0.921*s);

% Converting to state space model
num = [0  0  1.151  0.1774];
den = [1  0.739  0.921  0];

[A,B,C,D] = tf2ss(num, den);
sys_ss = ss(A,B,C,D);

% % Display the matrices in State-Space model
% disp('State Matrix A:');
% disp(A);
% disp('Input Matrix B:');
% disp(B);
% disp('Output Matrix C:');
% disp(C);
% disp('Feedthrough Matrix D:');
% disp(D);

Ts = 1/100;
sys_d = c2d(sys_ss,Ts,'zoh') % c2d - Continuous to Discrete conversion in MATLAB

% Checking and Verifying the controllability
co = ctrb(sys_d);
Controllability = rank(co)

% Controller design via pole-placement
A = sys_d.a;
B = sys_d.b;
C = sys_d.c;
D = sys_d.d;
p = 50;
Q = p*C'*C
R = 1;
[K] = dlqr(A,B,Q,R)

% Generating the digital (Stair-step) response
% time = 0:0.01:10;
% theta_des = 0.2*ones(size(time));
% sys_cl = ss(A-B*K,B,C,D,Ts);
% [y,t] = lsim(sys_cl,theta_des);
% stairs(t,y)
% xlabel('time (sec)');
% ylabel('pitch angle (rad)');
% title('Closed-Loop Step Response: DLQR');

Nbar = 6.95;
sys_cl = ss(A-B*K,B*Nbar,C,D,Ts);
[y,t] = lsim(sys_cl,theta_des);
stairs(t,y)
xlabel('time (sec)');
ylabel('pitch angle (rad)');
title('Closed-Loop Step Response: DLQR with Precompensation');