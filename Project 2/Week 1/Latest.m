% Define parameters  

radius = 200; % Radius of curved sections  

straight_length = 900; % Length of straight sections  

width = 15; % Width of the track  

num_points = 100; % Number of points for drawing curves  

% Define the curved sections  

theta1 = linspace(-pi/2, pi/2, num_points);  

x1 = radius * cos(theta1);  

y1 = radius * sin(theta1) + radius;  

theta2 = linspace(pi/2, 3*pi/2, num_points);  

x2 = radius * cos(theta2);  

y2 = radius * sin(theta2) - radius;  

% Define the straight sections  

x3 = linspace(straight_length/2, -straight_length/2, num_points);  

y3 = ones(1, num_points) * radius;  

x4 = fliplr(x3);  

y4 = ones(1, num_points) * -radius;  

% Concatenate all points  

x = [x1+450, x3, x2-450, x4];  

y = [y1, y3+200, y2+400, y4+200];  

% Plot the race track  

figure;  

plot(x, y, 'k', 'LineWidth', 2);  

hold on;  

% Plot the vehicle as a patch  

vehicle_width = 10; % Width of the vehicle  

vehicle_length = 15; % Length of the vehicle  

% Coordinates of the vehicle  

vehicle_x = [-vehicle_length/2, vehicle_length/2, vehicle_length/2, -vehicle_length/2];  

vehicle_y = [-vehicle_width/2, -vehicle_width/2, vehicle_width/2, vehicle_width/2];  

% Initial position of the vehicle  

initial_pos = [x(1), y(1)];  

% Patch vertices  

patch_x = vehicle_x + (initial_pos(1)-450);  

patch_y = vehicle_y + initial_pos(2);  

% Plot the vehicle patch  

patch(patch_x, patch_y, 'b');  

axis equal;  

title('Race Track with Vehicle');  

xlabel('X');  

ylabel('Y');  

grid on;  

% Loop for animation 

for i = 1:length(x) 

% Update the position of the vehicle patch 

patch_x = vehicle_x + x(i); 

patch_y = vehicle_y + y(i); 

% Plot the race track 

plot(x, y, 'k', 'LineWidth', 2); 

hold on; 

% Plot the vehicle patch 

patch(patch_x, patch_y, 'r'); 

axis equal; 

title('Race Track with Moving Vehicle'); 

xlabel('X'); 

ylabel('Y'); 

grid on; 

% animated_x = patch_x; 
% 
% animated_y = patch_y; 
% 
% animatedline(animated_x, animated_y, 'Color', 'r','LineWidth', 2); 
% 
% drawnow; 

% Pause for a short duration to control the speed of the animation 

pause(0.01); 

% Clear the current plot for the next iteration 

clf; 

end 

 
