J1_var = 100; 
b1_var = 1; 
J2_var = 1; 
b2_var = 1;  
A = [1,100]; 

fixed_solver = ["ode1", "ode4"]; % Fixed Time Step Solver [Euler]
variable_solver = "ode45"; % variable Time Step Solver [Euler]
set_param('Project1_Part2', 'StopTime', '25')


tstart = cputime;

% for ODE 1
dT = ".1";
for i = 1:length(A)
    A_var = A(i);
    simout = sim("Project1_Part2.slx","Solver","ode1","FixedStep",dT);
    omega = simout.w.Data;
    time = simout.tout;
    figure
    scatter(time,omega)
    title("Shaft speed vs time for ode1 where step size is "+ dT + " and A is " + A_var)
    xlabel("Time")
    ylabel("Shaft speed")
end

dT = "1";
for i = 1:length(A)
    A_var = A(i);
    simout = sim("Project1_Part2.slx","Solver","ode1","FixedStep",dT);
    omega = simout.w.Data;
    time = simout.tout;
    figure
    scatter(time,omega)
    title("Shaft speed vs time ode1 where step size is "+ dT + " and A is " + A_var)
    xlabel("Time")
    ylabel("Shaft speed")
end

% for ODE4
dT = ".1";
for i = 1:length(A)
    A_var = A(i);
    simout = sim("Project1_Part2.slx","Solver","ode4","FixedStep",dT);
    omega = simout.w.Data;
    time = simout.tout;
    figure
    scatter(time,omega)
    title("Shaft speed vs time ode1 where step size is "+dT + " and A is " + A_var)
    xlabel("Time")
    ylabel("Shaft speed")
end

dT = "1";
for i = 1:length(A)
    A_var = A(i);
    simout = sim("Project1_Part2.slx","Solver","ode4","FixedStep",dT);
    omega = simout.w.Data;
    time = simout.tout;
    figure
    scatter(time,omega)
    title("Shaft speed vs time ode1 where step size is "+dT + " and A is " + A_var)
    xlabel("Time")
    ylabel("Shaft speed")
end

% for ode45
for i = 1:length(A)
    A_var = A(i);
    simout = sim("Project1_Part2.slx","Solver","ode45","FixedStep",dT);
    omega = simout.w.Data;
    time = simout.tout;
    figure
    scatter(time,omega)
    title("Shaft speed vs time ode1 where step size is " + dT + " and A is " + A_var)
    xlabel("Time")
    ylabel("Shaft speed")
end

Time_Total = cputime - tstart;