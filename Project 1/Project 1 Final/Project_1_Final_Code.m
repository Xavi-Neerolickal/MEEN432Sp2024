% Project 1 Demo/Scaffolding
% this code is to be used a start-off point, do not expect this code to be
% perfect already.

% Initial Conditions 
w_0_initial = [10.0,0.0]; % Initial Angular Velocity [rad/s]
J_initial = [100,0.01]; % Rotational Inertia [kg-m^2]
b_initial = [10,0.1]; % Damping Coefficient [N-m-s/rad]
A_initial = [0,100]; % Constant Applied Torque [N-m]
frequency_initial=[0.1,100];%frequency 
dT_initial = [0.001, 0.1, 1]; % Time Step [s]
solver_fixed_initial = ["ode1", "ode4"]; % Fixed Time Step Solver [Euler=ode1,runge-kutta=ode4]
solver_var_initial=["ode45","ode23tb"]; %variable time step, dt/time-step is not applicabe
count = 0; % Counter to toggle between sinusoidal and fixed

for solver_fixed_index = 1:2
    for w_0_index = 1:2
        w_0 = w_0_initial(w_0_index);
        for J_index = 1:2
            J = J_initial(J_index);
            for b_index = 1:2
                b = b_initial(b_index);
                    for A_index = 1:2
                        A = A_initial(A_index);
                        frequency = 0;
                        tStart = cputime;
                        simout_fixed = sim("Project1_week3_sim","Solver",solver_fixed_initial(solver_fixed_index),"FixedStep",string(dT_initial));
                        tEnd = cputime;
                        simulation_time = tStart-tEnd; % simulation time
                        W_array = simout_fixed.w.Data;
                        T = simout_fixed.tout;
                        W = W_array(length(W_array));
                        % W_theory = (A_initial(A_index)/b_initial(b_index))*(1-exp((b_initial(b_index * -1 * simulation_time))/(J_initial(J_index)))) + w_0_initial*exp(((b_initial(b_index * -1 * simulation_time))/(J_initial(J_index))));
                        % error = W - W_theory;
                        W_dot_array = simout_fixed.w_dot.Data;
                        W_dot = W_dot_array(length(W_dot_array));
                        simout_fixed.w.plot();
                        title("Fixed");
                        xlabel("Time");
                        ylabel("Angular Velocity");
                        figure;
                        simout_fixed.w_dot.plot();
                        title("Fixed");
                        xlabel("Time");
                        ylabel("Angular Acceleration");
                        figure;
                        plot(T, simulation_time);
                        simout_fixed.w.plot();
                        title("Fixed");
                        xlabel("Time Step"); % plots for simulation time
                        ylabel("Simulation Time");
                        figure;
                        count = count + 1;
                        for freq_index = 1:2
                            count = count + 1;
                            tStart = cputime;
                            simout_fixed = sim("Project1_week3_sim","Solver",solver_fixed_initial(solver_fixed_index),"FixedStep",string(dT_initial));
                            tEnd = cputime;
                            simulation_time = tStart-tEnd; % simulation time
                            T = simout_fixed.tout;
                            W_array = simout_fixed.w.Data;
                            W = W_array(length(W_array));
                            W_dot_array = simout_fixed.w_dot.Data;
                            W_dot = W_dot_array(length(W_dot_array));
                            simout_fixed.w.plot();
                            title("Fixed Sinusoidal");
                            xlabel("Time");
                            ylabel("Angular Velocity");
                            figure;
                            simout_fixed.w_dot.plot();
                            title("Fixed Sinusoidal");
                            xlabel("Time");
                            ylabel("Angular Acceleration");
                            figure; 
                            T = simout_fixed.tout;
                            plot(T, simulation_time);
                            simout_fixed.w.plot();
                            title("Fixed");
                            xlabel("Time Step");
                            ylabel("Simulation Time");
                            figure;
                        end
                    end
            end
        end
    end
end
for solver_var_index = 1:2
    for w_0_index = 1:2
        w_0 = w_0_initial(w_0_index);
        for J_index = 1:2
            J = J_initial(J_index);
            for b_index = 1:2
                b = b_initial(b_index);
                    for A_index = 1:2
                        A = A_initial(A_index);
                        frequency = 0;
                        tStart = cputime;
                        simout_var = sim("Project1_week3_sim","Solver",solver_var_initial(solver_var_index));
                        tEnd = cputime;
                        simulation_time = tStart-tEnd;
                        W_array_var = simout_var.w.Data;
                        W_var = W_array_var(length(W_array_var));
                        W_dot_array_var = simout_var.w_dot.Data;
                        W_dot_var = W_dot_array_var(length(W_dot_array_var));
                        simout_var.w.plot();
                        title("Variable");
                        xlabel("Time");
                        ylabel("Angular Velocity");
                        figure;
                        simout_var.w_dot.plot();
                        title("Variable");
                        xlabel("Time");
                        ylabel("Angular Acceleration");
                        figure;
                        T = simout_fixed.tout;
                        plot(T, simulation_time);
                        simout_fixed.w.plot();
                        title("Fixed");
                        xlabel("Time Step");
                        ylabel("Simulation Time");
                        figure;
                        count = count + 1;
                        for freq_index = 1:2
                            count = count + 1;
                            tStart = cputime;
                            simout_var = sim("Project1_week3_sim","Solver",solver_var_initial(solver_var_index));
                            tEnd = cputime;
                            simulation_time = tStart-tEnd;
                            W_array_var = simout_var.w.Data;
                            W_var = W_array_var(length(W_array_var));
                            W_dot_array_var = simout_var.w_dot.Data;
                            W_dot_var = W_dot_array_var(length(W_dot_array_var));
                            simout_var.w.plot();
                            title("Variable Sinusoidal");
                            xlabel("Time");
                            ylabel("Angular Velocity");
                            figure;
                            simout_var.w_dot.plot();
                            title("Fixed Sinusoidal");
                            xlabel("Time");
                            ylabel("Angular Acceleration");
                            figure;
                            T = simout_fixed.tout;
                            plot(T, simulation_time);
                            simout_fixed.w.plot();
                            title("Fixed");
                            xlabel("Time Step");
                            ylabel("Simulation Time");
                            figure;
                        end
                    end
            end
        end
    end
end

J1 = 100; b1 = 1; J2 = 1; b2 = 1;
stiffness = [10, 100, 1000];
dT1 = [0.001, 0.1];
for solver_fixed_index = 1:2
    for k_index = 1:3
        k = stiffness(k_index);
        tStart = cputime;
        simout = sim("Project_1_final.slx", "Solver", solver_fixed(solver_fixed_index), "FixedStep", string(dT1));
        tEnd = cputime;
        simulation_time = tStart-tEnd;
        simout.w_final.plot();
        title("Shaft Speed");
        xlabel("Time");
        ylabel("Shaft Speed");
        figure;
    end
end
display(count);
