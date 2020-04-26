clear; clf; clc;
delta = 0.005;
NoPath=1;
g=0;
title('A* Algorithm')
[gridSize, MAP, xGoal, yGoal, xRobot, yRobot] = designWorld;

[closedSet,closedCount] = putInClosed(MAP);
gridMat = zeros(gridSize);
gMatrix = zeros(gridSize);

x=xRobot;
y=yRobot;
h=calcH(x,y,xGoal,yGoal);
openCount=1;
openSet(1,:)=putInOpen(x,y,x,y,g,h,h);

closedCount=closedCount+1;
closedSet(closedCount,1)=xRobot;
closedSet(closedCount,2)=yRobot;

tempH = popHeu (gridMat,xGoal,yGoal);
hMatrix = MAP .*tempH

while(( (x ~= xGoal) || (y ~= yGoal) ) && NoPath == 1)
    %plot(x+.5,y+.5,'x');
    %pause(delta);
    neighborList=gatherNeighbor(x,y,g,xGoal,yGoal,closedSet,gridSize);
    neighborCount=size(neighborList,1);
    
    for i=1:neighborCount
        flag=0;
        for j=1:openCount
            if(neighborList(i,1) == openSet(j,2) && neighborList(i,2) == openSet(j,3) )
                openSet(j,8)=min(openSet(j,8),neighborList(i,5));
                if openSet(j,8)== neighborList(i,5)
                    openSet(j,4)=x;
                    openSet(j,5)=y;
                    openSet(j,6)=neighborList(i,3);
                    openSet(j,7)=neighborList(i,4);
                end;
                flag=1;
            end;
            
        end
        if flag == 0
            openCount = openCount+1;
            openSet(openCount,:)=putInOpen(neighborList(i,1),neighborList(i,2),x,y,neighborList(i,3),neighborList(i,4),neighborList(i,5));
        end;
    end
    
    lowF = lowCost(openSet,openCount,xGoal,yGoal);
    if (lowF ~= -1)
        
        x=openSet(lowF,2);
        y=openSet(lowF,3);
        g=openSet(lowF,6);
        gMatrix(x,y) = g;
        printV = g + hMatrix(x,y);
        text(x+.5,y+.5,num2str(printV));
        pause(delta)
        closedCount=closedCount+1;
        closedSet(closedCount,1)=x;
        closedSet(closedCount,2)=y;
        openSet(lowF,1)=0;
    else
        
        NoPath=0;
    end;
end;

gMatrix

i=size(closedSet,1);
optimalPath=[];
xCor=closedSet(i,1);
yCor=closedSet(i,2);
i=1;
optimalPath(i,1)=xCor;
optimalPath(i,2)=yCor;
i=i+1;

if ( (xCor == xGoal) && (yCor == yGoal))
    pointer=0;
    
    xParent=openSet(matchParent(openSet,xCor,yCor),4);
    yParent=openSet(matchParent(openSet,xCor,yCor),5);
    
    
    while( xParent ~= xRobot || yParent ~= yRobot)
        optimalPath(i,1) = xParent;
        optimalPath(i,2) = yParent;
        pointer=matchParent(openSet,xParent,yParent);
        xParent=openSet(pointer,4);
        yParent=openSet(pointer,5);
        i=i+1;
    end;
    optimalPath(i,1) = xRobot;
    optimalPath(i,2) = yRobot;
 
    xlabel('SUCCESS !! -- Here is the Optimal Path','Color','b');
    plot(optimalPath(:,1)+.5,optimalPath(:,2)+.5,'Color','b','LineWidth', 2);
    
else
    xlabel('NO PATHS AVAILABLE !!','Color','r');
end