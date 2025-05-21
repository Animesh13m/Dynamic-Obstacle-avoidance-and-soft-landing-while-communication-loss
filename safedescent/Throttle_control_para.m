    enable = 1;
    throttle_ref = 0;  % Target throttle is zero for smooth descent

    if throttle_vel > 0
        % Throttle is increasing: limit using takeoff parameters
        max_throttle_vel   = takeoff_lim(1);
        max_throttle_accel = takeoff_lim(2);
    else
        % Throttle is decreasing: limit using landing parameters
        max_throttle_vel   = land_lim(1);
        max_throttle_accel = land_lim(2);
    end
