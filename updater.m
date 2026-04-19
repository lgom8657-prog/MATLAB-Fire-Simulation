function updateddrone = updater(drone,fire)

updateddrone = drone;
%checks proximity of the drones and established moving priority ammong
%drones h is for hold and g is for go
if norm(drone(1).location-drone(2).location)<=sqrt(2)
    drone(2).status="h"
else
    drone(2).status="g"
end
if norm(drone(2).location-drone(3).location)<=sqrt(2)
    drone(3).status="h"
else
    drone(3).status="g"
end
if norm(drone(1).location-drone(3).location)<=sqrt(2)
    drone(3).status="h"
else
    drone(3).status="g"
end
[drone(1).target, drone(2).target, drone(3).target] = targetfind(drone, fire.intensity);
%if there is no hold, the loop goes through each possibility of where the
%drone can move and chooses the first choice that brings it closer to a
%target
%changes the location of the drone after deciding where to move
for i=1:3
    if drone(i).status=="g"
        if norm(drone(i).target-(drone(i).location+[1,1]))<norm(drone(i).target-drone(i).location)
                updateddrone(i).location = drone(i).location+[1,1];
        elseif norm(drone(i).target-(drone(i).location+[0,1]))<norm(drone(i).target-drone(i).location)
                updateddrone(i).location = drone(i).location+[0,1];
        elseif norm(drone(i).target-(drone(i).location+[-1,1]))<norm(drone(i).target-drone(i).location)
                updateddrone(i).location = drone(i).location+[-1,1];
        elseif norm(drone(i).target-(drone(i).location+[-1,0]))<norm(drone(i).target-drone(i).location)
                updateddrone(i).location = drone(i).location+[-1,0];
        elseif norm(drone(i).target-(drone(i).location+[-1,-1]))<norm(drone(i).target-drone(i).location)
                updateddrone(i).location = drone(i).location+[-1,-1];
        elseif norm(drone(i).target-(drone(i).location+[0,-1]))<norm(drone(i).target-drone(i).location)
                updateddrone(i).location = drone(i).location+[0,-1];
        elseif norm(drone(i).target-(drone(i).location+[1,-1]))<norm(drone(i).target-drone(i).location)
                updateddrone(i).location = drone(i).location+[1,-1];
        elseif norm(drone(i).target-(drone(i).location+[1,0]))<norm(drone(i).target-drone(i).location)
                updateddrone(i).location = drone(i).location+[1,0];
        else
            updateddrone(i).location = drone(i).location;
        end 
    end
end