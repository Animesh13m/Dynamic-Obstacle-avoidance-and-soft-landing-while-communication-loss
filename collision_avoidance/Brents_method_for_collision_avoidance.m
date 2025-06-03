function optimal_throttle = calculateThrottle(Throttle, BF_Height, minDepth, z_ref, Throttle_der) 
%#codegen
    % Initialize outputs
    optimal_throttle = 0.0;
    height_error = 0.0;

    % ===== PARAMETERS =====
    safety_margin = 0.3;             % Obstacle danger threshold (m)
    nominal_throttle = 13.3;          % Stable hover throttle value
    min_throttle = 12.5;              % Minimum allowed throttle
    max_throttle = 13.6;              % Maximum allowed throttle
    
    % Adjusted Cost Function Weights
    weight_height_error = 23;        % Lower priority for height tracking
    weight_throttle_stability = 120;  % Lower priority for throttle consistency
    weight_obstacle = 24.0;            % Higher priority for obstacle avoidance
    weight_velocity = 2.5;            % Higher penalty for throttle change
    obstacle_activation_scale = 100;  % Increased multiplier when obstacle is too close
    % ======================

    % Cost function components
    height_error = (BF_Height - z_ref)^2;
    obstacle_penalty = (minDepth < safety_margin) * obstacle_activation_scale;
    velocity_penalty = max(0, Throttle_der);  % Penalize only positive throttle derivative

    % Cost function with updated weights
    cost_func = @(throttle) ...
        weight_height_error * height_error + ...
        weight_throttle_stability * (throttle - nominal_throttle)^2 + ...
        weight_obstacle * obstacle_penalty * throttle^2 + ...
        weight_velocity * velocity_penalty;

    % Optimization with bounded search
    options = optimset('Display', 'off', 'TolX', 0.1);
    optimal_throttle = fminbnd(cost_func, min_throttle, max_throttle, options);
    
    % Clamp final output
    optimal_throttle = max(min(optimal_throttle, max_throttle), min_throttle);
end
