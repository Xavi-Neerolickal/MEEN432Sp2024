% Project 1 Demo/Scaffolding
% this code is to be used a start-off point, do not expect this code to be
% perfect already.

% Initial Conditions 
w_0 = 1.0; % Initial Angular Velocity [rad/s]
J = 1; % Rotational Inertia [kg-m^2]
b = 1; % Damping Coefficient [N-m-s/rad]
A = 1; % Constant Applied Torque [N-m]

dT = [0.001, 0.1, 1]; % Time Step [s]
solver = ["ode1", "ode4"]; % Fixed Time Step Solver [Euler]
simout = sim("P1_demo.slx","Solver",solver,"FixedStep",string(dT));

for dT = 1:3
    for solver = 1:2
        W = simout.w.Data;
        W_DOT = simout.w_dot.Data;
        T = simout.tout;

        plot(T,W);
        xlabel("time")
        ylabel("angular_velocity")
        figure;
        plot(T, W_DOT);
        xlabel("time")
        ylabel("angular acceleration")
        figure;
        tStart = cputime;
        pause(1);
        tEnd = cputime - tStart;
        disp(tEnd);
    end
end


%simout = sim("P1_demo.slx");

% W = simout.w.Data;
% W_DOT = simout.w_dot.Data;
% T = simout.tout;
% 
% plot(W,T);
% plot(W_DOT,T);



