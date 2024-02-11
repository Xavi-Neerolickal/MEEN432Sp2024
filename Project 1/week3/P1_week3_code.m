% Project 1 Demo/Scaffolding
% this code is to be used a start-off point, do not expect this code to be
% perfect already.

% Initial Conditions 
w_0 = [10.0,0.0]; % Initial Angular Velocity [rad/s]
J = [100,0.01]; % Rotational Inertia [kg-m^2]
b = [10,0.1]; % Damping Coefficient [N-m-s/rad]
A = [0.0, 100,0,100]; % Constant Applied Torque [N-m]

freq=[0.1,100];%frequency 

dT = [0.001, 0.1, 1]; % Time Step [s]
solver_fixed = ["ode1", "ode4"]; % Fixed Time Step Solver [Euler=ode1,runge-kutta=ode4]
solver_var=["ode45","ode23tb"]; %variable time step, dt/time-step is not applicabe

simout = sim("Project1_week2_sim","Solver",solver_fixed,"FixedStep",string(dT));


for dT = 1:3
    for solver_fixed = 1:2
        for A = 1:2
            bool= 0;
        end
        for A = 3:4
            bool= 1;
        end
        W = simout.w.Data;
        W_DOT = simout.w_dot.Data;
        T = simout.tout;
        [m,n] = size(W_DOT);
        disp(W_DOT);
        for i = 1:m
            for j = 1:n
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
    end
end


simout_var = sim("Project1_week2_sim","Solver",solver_var);

    for solver_var = 1:2
        W = simout_var.w.Data;
        W_DOT = simout_var.w_dot.Data;
        T = simout_var.tout;

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


% simout = sim("P1_demo.slx");
% 
% W = simout.w.Data;
% W_DOT = simout.w_dot.Data;
% T = simout.tout;
% 
% plot(W,T);
% plot(W_DOT,T);



