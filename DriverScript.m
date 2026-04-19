% THIS IS THE DRIVER SCRIPT FOR THE WILDFIRE PROJECT %
clear, clc, close all;
%
% PARAMETERS
run Parameters.m;
%
% INITIALIZATION
fire  = init_fire(params);
drone = initDrones(fire,params);

nRows = params.grid_vert;
nCols = params.grid_horz;
% CODE
for t = 1:params.dt:params.t_int
    fire = fire_step(fire, params);
    drone = updater(drone, fire);
        for i = 1:length(drone)
    end
    run plot_state.m;
    drawnow
    pause(0.5)
end

