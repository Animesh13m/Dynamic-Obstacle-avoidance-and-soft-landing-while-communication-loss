function K = LOSS_DETECTED(tracking_loss,sys_throt)
    % Declare persistent variables to retain values across function calls
    persistent throt1 loss_occurred;
  
    if isempty(throt1)
        throt1 = sys_throt;
        loss_occurred = 0;  % Initialize flag to indicate if loss has occurred
    end

    K=loss_occurred
    
  % If tracking_loss is 0 and loss has not occurred yet, connect y to sys_throt
    if tracking_loss == 0 && ~loss_occurred
        throt1 = sys_throt;   % Keep throttle at sys_throt while no loss
        y = sys_throt;  
    
    elseif (tracking_loss == 1 && ~loss_occurred)||(tracking_loss == 0 && loss_occurred)
        % If tracking_loss becomes 1 for the first time, start reducing throttle
        loss_occurred = 1;  % Set the flag to indicate that loss occurred

    end

   
end