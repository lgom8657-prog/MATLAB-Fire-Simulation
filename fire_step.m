function fire = fire_step(fire, params);

% Function fire_step updates the intensity of fire one step at a time

% Burning cells spread to its NSEW neighbors
% cells naturally decay by a small amount
% values are clamped between [0, 1]

% Inputs:

%  fire 
% .intensity -  a GridSize x GridSize matrix with values in [0(no fire),1(fire)]

% Params 
% SpreadRate - the rate at which fire spreads to its neighbors
% DecayRate - how much the fire decays naturally after each step
% GridSize - number of rows and columns

% Outputs:

% fire - the updated struct with new intensity


nRows = params.grid_vert;
nCols = params.grid_horz;
OldIntensity = fire.intensity;

for row = 1:nRows
    for col = 1:nCols
        if OldIntensity(row,col) > 0
            % North
            if row > 1
                fire.intensity(row-1,col) = min(fire.intensity(row-1,col) + params.SpreadRate * OldIntensity(row,col), 1);
            end 
            % South
            if row < nRows
                fire.intensity(row + 1,col) = min(fire.intensity(row + 1, col) + params.SpreadRate * OldIntensity(row,col), 1);
            end
            % West
            if col > 1
                fire.intensity(row,col - 1) = min(fire.intensity(row,col - 1) + params.SpreadRate * OldIntensity(row,col), 1);
            end
            % East
            if col < nCols
                fire.intensity(row,col+1) = min(fire.intensity(row, col + 1) + params.SpreadRate * OldIntensity(row,col), 1);
            end
        end
    end
end

fire.intensity = fire.intensity - params.DecayRate;

% Clamps values to just [0, 1]
fire.intensity = max(fire.intensity, 0);
fire.intensity = min(fire.intensity, 1);
end