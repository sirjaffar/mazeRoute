function i = lowCost(openSet,openCount,xGoal,yGoal)

 tempStore=[];
 k=1;
 flag=0;
 goal=0;
 for j=1:openCount
     if (openSet(j,1)==1)
         tempStore(k,:)=[openSet(j,:) j];
         if (openSet(j,2)==xGoal && openSet(j,3)==yGoal)
             flag=1;
             goal=j;
         end;
         k=k+1;
     end;
 end;
 if flag == 1 
     i=goal;
 end
 
 if size(tempStore ~= 0)
  [f,tempF]=min(tempStore(:,8));
  i=tempStore(tempF,9);
 else
     i=-1;
 end;