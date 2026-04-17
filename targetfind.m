
function target = targetfind(drone,fire.intensity)
d0=cell(30,30);
for i=1:30
    for j=1:30
        d0{i,j}=[j,i];
    end
end
%makes a map to measure distances between points on the grid
D1=zeros(30,30);
D2=zeros(30,30);
D3=zeros(30,30);
    for i=1:30
         for j=1:30
        D1(i,j)=norm(d0{i,j}-drone(1).location);
        D2(i,j)=norm(d0{i,j}-drone(2).location);
        D3(i,j)=norm(d0{i,j}-drone(3).location);
         end
    end
%makes matrices where each entry is the distance from the drone to each point on the grid    
    [p1,r1,c1]=firesort(fire.intensity./(D1+1));
    [p2,r2,c2]=firesort(fire.intenssity./(D2+1));
    [p3,r3,c3]=firesort(fire.intensity./(D3+1));

target1=[c1(1),r1(1)];
target2=[c2(1),r2(1)];
target3=[c3(1),r3(1)];
%weighs each hotspot by the distance from the drone to that location and
%sorts the values then chooses the row and column with highest priority to
%be the target
target={target1,target2,target3}
end