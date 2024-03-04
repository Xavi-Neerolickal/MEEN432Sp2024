% Define parameters
radius = 200; % Radius of curved sections
straight_length = 900; % Length of straight sections
track_width = 15; % Width of the track

% Set up racetrack path
racetrack.path = struct('radius', radius, 'l_straight', straight_length, 'width', track_width);

% Simulate car motion
simulation_result = sim("p2_demon.slx");
car_x = simulation_result.X.Data;
car_y = simulation_result.Y.Data;
time_vector = simulation_result.tout;

% Analyze race statistics using a different function name (raceStat3)
race_stats = raceStat2(car_x, car_y, time_vector, racetrack.path);

% Visualization
figure;

% Plot car trajectory
plot(car_x, car_y, 'r');
hold on;

% Set plot limits
xlim([-400, 1300]);
ylim([-400, 800]);


% Plot racetrack outline in a different color (blue)
plot(car_x, car_y, 'Color', 'k', 'LineWidth', track_width);

title('Racetrack Simulation');
xlabel('X');
ylabel('Y');
grid on;

% Animated car representation (change color to red)
animated_car = animatedline('Color', 'r', 'LineWidth', 6);
axis([-1000, 2000, -500, 2000]);

% Car dimensions
car_width = 10;
car_height = 20;

% Create and initialize car shape (change color to green)
car_shape = [-car_width * 2, -car_width; car_width * 2, -car_width; car_width * 2, car_width; -car_width * 2, car_width]';
car_patch = patch('XData', car_shape(:, 1), 'YData', car_shape(:, 2));
car_patch.EdgeColor = 'w';
car_patch.FaceColor = 'r';

% Animated simulation loop
for i = 1:length(car_x) - 1
    x_pos = car_x(i);
    y_pos = car_y(i);
    
    % Add point to animated line
    addpoints(animated_car, x_pos, y_pos);

    % Calculate slope of the curve at the current point
    slope = (car_y(i + 1) - car_y(i)) / (car_x(i + 1) - car_x(i));
    
    % Rotate car according to the slope of the curve (rotate clockwise)
    rotation_angle = atan(slope);
    rotated_car = rotate(car_shape - mean(car_shape, 2), rotation_angle) + [x_pos; y_pos];
    
    % Update car image
    car_patch.XData = rotated_car(1, :);
    car_patch.YData = rotated_car(2, :);
    
    % Pause for animation
    pause(0.01);
    
    drawnow limitrate nocallbacks;
end

hold off;

function rotated_points = rotate(points, angle)
    rotation_matrix = [cos(angle), -sin(angle); sin(angle), cos(angle)];
    rotated_points = rotation_matrix * points;
end



