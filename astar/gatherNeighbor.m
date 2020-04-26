function neighbor=gatherNeighbor(yNode,xNode,h,xGoal,yGoal,closedSet,gridSize)
   
    neighbor=[];
    neighborCount=1;
    ss=size(closedSet,1);
    for k= 1:-1:-1
        for j= 1:-1:-1
            if ((k~=j || k~=0 )&&((j~=k)&&(j~=-k)&&(k~=-j)&&(-j~=-k)))  %Moves allowed [1 0] [0 1] [-1 0] [0 -1]
                x = yNode+k;
                y = xNode+j;
                if( (x >0 && x <=gridSize) && (y >0 && y <=gridSize))
                    flag=1;                    
                    for i=1:ss
                        if(x == closedSet(i,1) && y == closedSet(i,2))
                            flag=0;
                        end;
                    end;
                    if (flag == 1)
                        neighbor(neighborCount,1) = x;  % X-Coordinate
                        neighbor(neighborCount,2) = y;  % Y-Coordinate
                        neighbor(neighborCount,3) = h+calcH(yNode,xNode,x,y);   %Previous Heuristics Cost
                        neighbor(neighborCount,4) = calcH(xGoal,yGoal,x,y);     %Current Heuristics Cost
                        neighbor(neighborCount,5) = neighbor(neighborCount,3)+neighbor(neighborCount,4);    %Total cost        
                        neighborCount=neighborCount+1;
                    end
                end
            end
        end
    end    