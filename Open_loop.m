% Declaring the open loop Aircraft system
s = tf('s');
P_pitch = (1.151*s+0.1774)/(s^3+0.739*s^2+0.921*s);

% Converting to state space model
num = [0  0  1.151  0.1774];
den = [1  0.739  0.921  0];

[A,B,C,D] = tf2ss(num, den);

% Display the matrices in State-Space model
disp('State Matrix A:');
disp(A);
disp('Input Matrix B:');
disp(B);
disp('Output Matrix C:');
disp(C);
disp('Feedthrough Matrix D:');
disp(D);

% Open Loop Response generation
t = [0:0.01:10];
step(0.2*P_pitch, t); 
axis([0 10 0 0.8]);
ylabel('pitch angle (rad)');
title('Open-loop Step Response');

% To get the poles
pole(P_pitch)