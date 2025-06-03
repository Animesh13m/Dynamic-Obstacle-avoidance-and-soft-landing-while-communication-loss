function minAvgDepth = detect_min_distance_central(depthMatrix)
% detect_min_distance_central: Finds the minimum among average depth values
% from 80 blocks in the central third of a 480x640 depth image.

    % Validate input
    [rows, cols] = size(depthMatrix);
    if isempty(depthMatrix) || rows ~= 480 || cols ~= 640
        error('Input must be a 480x640 depth matrix.');
    end

    % Convert to double and handle zeros as NaN
    depthMatrix = double(depthMatrix);
    depthMatrix(depthMatrix == 0) = NaN;

    % Define central region
    row_start = floor(rows / 3);
    row_end   = floor(2 * rows / 3);
    col_start = floor(cols / 3);
    col_end   = floor(2 * cols / 3);
    central_region = depthMatrix(row_start:row_end, col_start:col_end);

    % Block parameters
    num_blocks_row = 8;
    num_blocks_col = 10;
    [central_rows, central_cols] = size(central_region);
    block_height = floor(central_rows / num_blocks_row);
    block_width  = floor(central_cols / num_blocks_col);

    avgValues = [];

    % Loop over blocks to compute average per block
    for i = 1:num_blocks_row
        for j = 1:num_blocks_col
            r_start = (i - 1) * block_height + 1;
            r_end = i * block_height;
            if i == num_blocks_row
                r_end = central_rows;
            end

            c_start = (j - 1) * block_width + 1;
            c_end = j * block_width;
            if j == num_blocks_col
                c_end = central_cols;
            end

            block = central_region(r_start:r_end, c_start:c_end);
            avg_val = mean(block(:), 'omitnan');

            if ~isnan(avg_val)
                avgValues(end+1) = avg_val; %#ok<AGROW>
            end
        end
    end

    % Take minimum among all block averages
    if isempty(avgValues)
        minAvgDepth = Inf;
    else
        minAvgDepth = min(avgValues);
    end
end
