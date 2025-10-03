clc;
clear all;

% Vehicle parameters
% global m g h L_f L_r r I_w

m = 1400;       % vehicle mass [kg]
g = 9.81;       % gravity [m/s^2]
r = 0.33;       % wheel radius [m]
I_w = 1.12;     % wheel inertia [kg*m^2]
T_brake = 2000; % constant brake torque per wheel [Nm]
%F_z = m*g/4 ;

% Initial conditions
% Initial conditions
v0 = 100/3.6;   % initial vehicle speed [m/s] (100 km/h)
w0 = v0/r;      % wheel angular velocity [rad/s]n

% Nominal normal load per axle (static)
%Road_type = 1 ;
% Define road type sequence in workspace
roadSequence = [1 3 2 1 1 1 1 1 1 1];   % dry → ice → wet → dry
%roadSequence = [1 1 1 1 1 1 1 1 1 1];   % dry → ice → wet → dry
time_Road_Sequence = 1 ;


% defining coeffecient of friction for differen road conditions
% Slip breakpoints
lambda_bp = (0:0.05:1)';   % Slip ratio (0 to 1, step 0.05)

% Dry asphalt (high grip)
mu_dry = ([0.00  0.40  0.80  0.97  1.00  0.98  0.96  0.94  0.92  0.90 0.88  0.85  0.83  0.81  0.79  0.77  0.75  0.73  0.72  0.71  0.70 ])';

% Wet asphalt (medium grip)
mu_wet = ([0.00  0.25  0.45  0.55  0.60  0.62  0.61  0.60  0.59  0.58 0.57  0.56  0.55  0.54  0.53  0.52  0.50  0.48  0.46  0.44  0.42 ])';

% Ice (very low grip)
mu_ice = ([0.00  0.05  0.10  0.12  0.13  0.14  0.14  0.14  0.14  0.14  0.14  0.14  0.14  0.14  0.14  0.14  0.14  0.14  0.14  0.14  0.14 ])';

%% lateral dynamics
delta  = 5 * pi/180 ;
