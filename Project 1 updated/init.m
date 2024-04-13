% Initializing values for the project as provided

w_0 = [0,10]; % Initial Angular Velocity [rad/s]
J = [.01,100]; % Rotational Inertia [kg-m^2]
b = [.1,10]; % Damping Coefficient [N-m-s/rad]
A = [0,100]; % Constant Applied Torque [N-m]
dT = [.001,.1,1];
sin_var = [0,1]; %Sinusoid indicator. 0 = step 1 = sin
switch_value = 0;
freq_var = [.1,100]; %Frequencies
freq = 1;
w_0_var = 0;
J_var = 0;
b_var = 0;
A_var = 0;
set_param('Project1_Part1', 'StopTime', '25')