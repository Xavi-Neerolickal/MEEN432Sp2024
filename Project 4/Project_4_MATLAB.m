
simout = sim("Project_4.slx","Stoptime",string(3600));
X = simout.X.signals.values;
Y = simout.Y.signals.values;
t = simout.X.time;
path.width = 15;
path.l_st = 900;
path.radius = 200;
%out = out.SOC.signals.values;
simout_2 = sim("Project_4.slx",'StopTime','3600');

stats = raceStat(X,Y,t,path,simout_2);

disp(stats)

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

xpath = [x1+900, x3+500, x2, x4+500]; 

ypath = [y1, y3+200, y2+400, y4+200];  

% Plot the race track  

% figure;  
% 
% plot(xpath, ypath, 'k', 'LineWidth', 2);  
% 
% hold on;  

figure;
hold on
set(gca, 'Color', 'white');
plot(xpath, ypath, 'LineWidth', 8,'Color','black');
xlim([-300, 1200]); 
ylim([-75, 500]);
hold off
title('Race Track');
xlabel('X-axis (m)');
ylabel('Y-axis (m)');
axis equal;  
car_length = 50;  
car_width = 20;  
x_car = [0, car_length, car_length, 0, 0];
y_car = [-car_width/2, -car_width/2, car_width/2, car_width/2, -car_width/2];
initial_orientation = 0;
car_patch = patch('XData', x_car, 'YData', y_car, 'FaceColor', 'r', 'EdgeColor', 'k');

for i = 2:length(X)
    set(car_patch, 'XData', x_car + X(i), 'YData', y_car + Y(i));
    if i > 2
        orientation = atan2(Y(i) - Y(i-1), X(i) - X(i-1));
    else
        orientation = atan2(Y(2) - Y(1), X(2) - X(1));
    end
    rotate(car_patch, [0, 0, 1], rad2deg(orientation - initial_orientation), [X(i), Y(i), 0]);
    pause(0.001); 
end
