% Calling function to do the calculation using the particular ODE 4

[cpu_ode4_001,error_ode4_001] = fixedstep("ode4",".001",w_0,J,b,A,sin_var,freq_var);
[cpu2_ode4_01,error_ode4_01] = fixedstep("ode4",".1",w_0,J,b,A,sin_var,freq_var);
[cpu3_ode4_1,error_ode4_1] = fixedstep("ode4","1",w_0,J,b,A,sin_var,freq_var);

% Plotting figures 

figure(1)
cpu = [cpu_ode4_001',cpu2_ode4_01',cpu3_ode4_1'];
scatter(dT,cpu)
legend
xlabel("Step Size (dT)")
ylabel("Cpu Time")
title("Ode 4 Cpu vs Step Size")

figure(2)
error = [error_ode4_001',error_ode4_01',error_ode4_1'];
scatter(dT,error)
xlabel("Step Size (dT)")
ylabel("Max Error")
title("Ode 4 Error vs Step Size")

figure(3)
scatter(cpu,error)
xlabel("Cpu time")
ylabel("Max Error")
title("Ode 4 Error vs CPU time")

% Calling function to do the calculation using the particular ODE 1
[cpu_ode1_001,error_ode1_001] = fixedstep("ode1",".001",w_0,J,b,A,sin_var,freq_var);
[cpu2_ode1_01,error_ode1_01] = fixedstep("ode1",".1",w_0,J,b,A,sin_var,freq_var);
[cpu3_ode1_1,error_ode1_1] = fixedstep("ode1","1",w_0,J,b,A,sin_var,freq_var);

% Plotting figures 

figure(4)
cpu = [cpu_ode1_001',cpu2_ode1_01',cpu3_ode1_1'];
scatter(dT,cpu)
legend
xlabel("Step Size")
ylabel("Cpu Time")
title("Ode 1 Cpu vs Step Size")

figure(5)
error = [error_ode1_001',error_ode1_01',error_ode1_1'];
scatter(dT,error)
xlabel("Step Size")
ylabel("Max Error")
title("Ode 1 Error vs Step Size")

figure(6)
scatter(cpu,error)
xlabel("Cpu time")
ylabel("Max Error")
title("Ode 1 Error vs CPU time")

% Calling function to do the calculation using the particular ODE 45

% ode 45
[cpu,error] = variabletime("ode45",w_0,J,b,A,sin_var,freq_var);

% Plotting figures 

figure(7)
scatter(cpu,error)
xlabel("Cpu time")
ylabel("Max Error")
title("Ode45 Error vs CPU time")


% ode 23tb
[cpu,error] = variabletime("ode23tb",w_0,J,b,A,sin_var,freq_var);

figure(8)
scatter(cpu,error)
xlabel("Cpu time")
ylabel("Max Error")
title("Ode23tb Error vs CPU time")

% for loop function for fixed step solution
function [cpu,error] = fixedstep(solver,stepsize,w_0,J,b,A,sin_var,freq_var)
    cpu = [];
    error = [];
    for i = 1:length(w_0)
        w_0_var = w_0(i);
        for j = 1:length(J)
            J_var = J(j);
            for k = 1:length(b)
                b_var = b(k);
                for o = 1:length(sin_var)
                    switch_value = sin_var(o);

                    %Step input
                    if (switch_value == 0)
                        freq=0;
                        for l = 1:length(A)
                        A_var = A(l);
                        
                         %CPU time calculation
                        tStart = cputime;
                        simout = sim("Project1_Part1.slx","Solver",solver,"FixedStep",stepsize);
                        tTotal = cputime - tStart;
                        cpu(end+1) = tTotal;

                        %Error Calculation
                        T = simout.tout;
                        true_val = [];
                        for t = 1:length(T)
                            true_val(end+1) = model(b_var,J_var,A_var,T(t),w_0_var);
                        end
                        W = simout.w.Data;
                        max_error = 0;
                        for q = 1:length(W)
                            error_temp = abs(true_val(q)-W(q));
                            if (error_temp > max_error)
                                max_error = error_temp;
                            end
                        end
                        error(end+1) = max_error;
                        end
                    end

                    %Sin torque
                    if (switch_value == 1)
                        A_var = 100;
                        for f = 1:length(freq_var)
                            freq = freq_var(f);
                            %CPU time calculation
                            tStart = cputime;
                            simout = sim("Project1_Part1.slx","Solver",solver,"FixedStep",stepsize);
                            tTotal = cputime - tStart;
                            cpu(end+1) = tTotal;

                            %Error Calculation
                            W_sin = simout.w.Data;
                            T_sin = simout.tout;
                            %Comparing against runge kutta ode4
                            simout = sim("Project1_Part1.slx","Solver","ode4","FixedStep",".001");
                            W_ode4 = simout.w.data;
                            T_ode4 = simout.tout;
                            max_error = 0;
                            for q = 1:length(T_sin)
                                %Sin and ode4 outputs can be different sizes.
                                %Mapping sin output to ode4 by finding
                                %where the times are the same.
                                error_temp = abs( W_sin(q) - W_ode4( find(T_ode4==T_sin(q))) );
                                if (error_temp > max_error)
                                    max_error = error_temp;
                                end
                            end
                            error(end+1) = max_error;
                         end
                    end
                 end
            end      
        end
    end
end


% for loop function for variable step solution
function [cpu,error] = variabletime(solver,w_0,J,b,A,sin_var,freq_var)
    cpu = [];
    error = [];
    for i = 1:length(w_0)
        w_0_var = w_0(i);
        for j = 1:length(J)
            J_var = J(j);
            for k = 1:length(b)
                b_var = b(k);
                for o = 1:length(sin_var)
                    switch_value = sin_var(o);

                    %Step input
                    if (switch_value == 0)
                        freq=0;
                        for l = 1:length(A)
                        A_var = A(l);
                        
                         %CPU time calculation
                        tStart = cputime;
                        simout = sim("Project1_Part1.slx","Solver",solver);
                        tTotal = cputime - tStart;
                        cpu(end+1) = tTotal;

                        %Error Calculation
                        T = simout.tout;
                        true_val = [];
                        for t = 1:length(T)
                            true_val(end+1) = model(b_var,J_var,A_var,T(t),w_0_var);
                        end
                        W = simout.w.Data;
                        max_error = 0;
                        for q = 1:length(W)
                            error_temp = abs(true_val(q)-W(q));
                            if (error_temp > max_error)
                                max_error = error_temp;
                            end
                        end
                        error(end+1) = max_error;
                        end
                    end

                    %Sin torque
                    if (switch_value == 1)
                        A_var = 100;
                        for f = 1:length(freq_var)
                            freq = freq_var(f);
                            %CPU time calculation
                            tStart = cputime;
                            simout = sim("Project1_Part1.slx","Solver",solver);
                            tTotal = cputime - tStart;
                            cpu(end+1) = tTotal;

                            %Error Calculation
                            W_sin = simout.w.Data;
                            T_sin = simout.tout;
                            %Comparing against runge kutta ode4
                            simout = sim("Project1_Part1.slx","Solver","ode4","FixedStep",".001");
                            W_ode4 = simout.w.data;
                            T_ode4 = simout.tout;
                            max_error = 0;
                            for q = 1:length(T_sin)
                                %Sin and ode4 outputs can be different sizes.
                                %Mapping sin output to ode4 by finding
                                %where the times are the same.
                                error_temp = abs( W_sin(q) - W_ode4( find(T_ode4==T_sin(q))) );
                                if (error_temp > max_error)
                                    max_error = error_temp;
                                end
                            end
                            error(end+1) = max_error;
                         end
                    end
                 end
            end
        end
    end
   
end

% modelling angular velocity with the given variables
function [angular_v] = model(b_var,J_var,T_0,t,w_0_var)
    angular_v = T_0/b_var*(1-exp(-b_var*t/J_var))+w_0_var*exp(-b_var*t/J_var);
end
