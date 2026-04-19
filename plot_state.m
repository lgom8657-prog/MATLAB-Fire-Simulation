figure(1);


    % Graphing time
    % Fire graph
    clf;
    imagesc(fire.intensity);
    colormap hot;
    axis equal;
    hold on;
    % Drone graph
    for i = 1:length(drone)
        scatter(drone(i).location(2), drone(i).location(1), 80, 'filled');
    end