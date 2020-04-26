function [gridSize, MAP, xGoal, yGoal, xRobot, yRobot] = designWorld()

answer = inputdlg('Enter the grid size N:','Welcome',1);
gridSize = answer{1};
gridSize = str2double(gridSize);
axis([1 (gridSize+1) 1 (gridSize+1)])
set(gca,'XTick',1:1:gridSize+1)
set(gca,'YTick',1:1:gridSize+1)
grid on
hold on
MAP=(ones(gridSize));
axis([1 gridSize+1 1 gridSize+1])
grid on;
hold on;

xlabel('Select the goal location','Color','k');
button=0;
while (button ~= 1)
    [xCor,yCor,button]=ginput(1);
end
xCor=floor(xCor);
yCor=floor(yCor);
xGoal=xCor;
yGoal=yCor;

MAP(xCor,yCor)=1;
plot( (xGoal+0.5), (yGoal+0.5), 'gp', 'MarkerSize',15, 'LineWidth', 2);
text(xGoal+.2,yGoal+.2,'Goal');

xlabel('Select the obstacles location, use right-click for placing last obstacle','Color','k');
while button == 1
    [xCor,yCor,button] = ginput(1);
    xCor=floor(xCor);
    yCor=floor(yCor);
    MAP(xCor,yCor)=-inf;
    plot( (xCor+0.5), (yCor+0.5), 'ks', 'MarkerSize',29, 'LineWidth', 3);
end

xlabel('Select the initial location of robot','Color','k');
button=0;
while (button ~= 1)
    [xCor,yCor,button]=ginput(1);
    xCor=floor(xCor);
    yCor=floor(yCor);
end
xRobot=xCor;
yRobot=yCor;
MAP(xCor,yCor)=1;
plot( (xRobot+0.5), (yRobot+0.5), 'bp', 'MarkerSize',15, 'LineWidth', 2);
text(xRobot+.2,yRobot+.2,'Robot');