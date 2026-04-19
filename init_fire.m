function fire = init_fire(params)

% init_fire function creates the intital fire struct

% function creates a GridSize by GridSize matrix of zeros, then places a
% choosen amount of fire hotspots at random locations with an intensity of
% 1.

% Inputs:
% params
% GridSize - number of rows and columns
% RndFire - number of randomly places fire hotspots

% Outputs:
% fire
% intensity - a GridSize x GridSize matrix with values in [0(no fire),1(fire)]


% Intial Matrix Grid
fire.intensity = zeros(params.grid_horz, params.grid_vert);

% Places Intital Hotspots in random locations

for i = 1:params.RndFire
    row = randi(params.grid_horz);
    col = randi(params.grid_vert);
    fire.intensity(row, col) = 1;
end
end