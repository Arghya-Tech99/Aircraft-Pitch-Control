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
poles = pole(P_pitch)

% Obtain the real part of the poles
real_parts = real(poles);

max_real_part = max(real_parts);

% Use a small tolerance for "equal to zero" checks (due to computational precision)
tolerance = 1e-9; 

% 1. Check for UNSTABLE: Any pole in the RHP (Re(p) > 0)
if max_real_part > tolerance
    disp('System Stability: UNSTABLE')
    disp('Reason: At least one pole has a positive real part (Re(p) > 0).')

% 2. Check for MARGINALLY STABLE: No RHP poles AND at least one pole on the jw-axis (Re(p) is zero)
elseif abs(max_real_part) < tolerance && any(abs(real_parts) < tolerance) && any(imag(poles) == 0)

    disp('System Stability: MARGINALLY STABLE')
    disp('Reason: All poles are in the LHP or on the jω-axis, and there is at least one non-repeated pole on the jω-axis')

% 3. Check for STABLE: All poles strictly in the LHP (Max Re(p) < 0)
else
    disp('System Stability: STABLE')
    disp('Reason: All poles have a negative real part (Re(p) < 0).')
end