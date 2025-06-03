function smoothedDepth = slidingAverageDepth(newDepth)
    %#codegen
    persistent depthBuffer idx bufferSize
    
    if isempty(depthBuffer)
        bufferSize = 6;  % window size
        depthBuffer = ones(bufferSize,1) * newDepth;  % initialize
        idx = 1;
    end
    
    % Insert the new value
    depthBuffer(idx) = newDepth;
    idx = mod(idx, bufferSize) + 1;
    
    % Compute average
    smoothedDepth = mean(depthBuffer);
end
