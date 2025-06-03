function w = compute_reward(minDepth)
    % Define thresholds
    midIssueThresholdUpper = 0.5; % Upper bound for mid issue
 
    % Assign reward based on minDepth (closest object distance)
    if minDepth < midIssueThresholdUpper
        w = 1;  % Danger condition (too close)
     
    else
        w = 0;   % Safe condition
    end
end
