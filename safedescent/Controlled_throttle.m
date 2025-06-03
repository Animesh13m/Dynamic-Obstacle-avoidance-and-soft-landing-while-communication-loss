function [enable, throttle_ref, max_throttle_vel, max_throttle_accel] = Not_tracking(sigmoid_type, trim_throttle, takeoff_lim, land_lim, throttle_vel)

% Note: Some of the cases below are identical. However, they are separated out 
% based on the states of the state machine for ease of modification in the future. 
% For example, states 4 and 5 are identical. However, if the user wants different 
% signmoid behaviour when taking off than when landing, these cases may not be the same. 

enable = 0;
throttle_ref = 0;
max_throttle_vel = 0;
max_throttle_accel = 0;

switch sigmoid_type
    case 1 % sigmoid = 1 - Command 0 throttle
        % This is for the IDLE, ARM, E_ABORT, and DISABLE states of the FSM
        enable = 0;
        throttle_ref = 0;
        max_throttle_vel = 0;
        max_throttle_accel = 0;

    case 2 % sigmoid = 2 - Sigmoid throttle up from 0 to the trim value
        % This is for the TAKEOFF THROTTLE state of the FSM
        enable = 1;
        throttle_ref = trim_throttle;
        max_throttle_vel = takeoff_lim(1);
        max_throttle_accel = takeoff_lim(2);

    case 3 % sigmoid = 3 - Pass controller throttle straight through + trim value.
        % This is for the TAKEOFF HEIGHT and FLIGHT state of the FSM
        enable = 1;
        throttle_ref = trim_throttle;
        max_throttle_vel = takeoff_lim(1);
        max_throttle_accel = takeoff_lim(2);

    case 4 % sigmoid = 4 - Ignore controller throttle. Sigmoid it down to 0.
        % This is for the E_Landing state of the FSM
        enable = 1;
        throttle_ref = 0;
        if throttle_vel > 0
            max_throttle_vel = takeoff_lim(1);
            max_throttle_accel = takeoff_lim(2);
        else
            max_throttle_vel = land_lim(1);
            max_throttle_accel = land_lim(2);
        end
        
    case 5 % sigmoid = 5 - Pass controller throttle straight through + trim value.
        % This is for the AUTOLAND state of the FSM
        enable = 1;
        throttle_ref = trim_throttle;
        max_throttle_vel = takeoff_lim(1);
        max_throttle_accel = takeoff_lim(2);

end