function drone = initDrones(fire,params)
%uses a map to measure distances between points on the grid
d0=cell(30,30);
for i=1:30
    for j=1:30
        d0{i,j}=[j,i];
    end
end
for i=1:params.n_drones
    drone(i).location=randi(30,1,2);
    drone(i).status="g";
    drone(i).target=[];
end
%initialized the struct array for drones
%then uses updater to continually update the state of the drones until the
%last time step
while params.t_int<30
    for i=1:3
        if firemap(drone(i).location(2),drone(i).location(1))>=0;
            firemap(drone(i).location(2),drone(i).location(1))=0;
        end
        drone=updater(drone,fire);
    end
end
end
