function [ out ] = DoAction( action, position,maze )

x = position(1);
y = position(2); 

[N,M] = size(maze);
xmax = N-1; 
xmin = 1;
ymax = M-1; 
ymin = 1;

 
if (action==1)
    y = y + 1;
elseif (action==2)
    x = x + 1;
elseif (action==3)
    y = y - 1;
elseif (action==4)
    x = x - 1;
end

x = min(xmax,x);
x = max(xmin,x);

y = min(ymax,y);
y = max(ymin,y);

if maze(x+1,y+1)==1
    x = position(1);
    y = position(2); 
end
out=[x y];







