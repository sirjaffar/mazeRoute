function H = popHeu (gridMat,xGoal,yGoal)

gs = size(gridMat);
for i = 1:gs(1)
    for j = 1:gs(1)
        H(i,j)=abs((i-xGoal)^2 + (j-yGoal)^2);
    end
end
end