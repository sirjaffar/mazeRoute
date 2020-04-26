function [closedSet,closedCount] = putInClosed (MAP)
closedSet=[];
ss = size(MAP);
k=1;
j=0;
for i=1:ss(1)
    for j=1:ss(1)
        if(MAP(i,j) == -inf)
            closedSet(k,1)=i; 
            closedSet(k,2)=j; 
            k=k+1;
        end
    end
end
closedCount=size(closedSet,1);