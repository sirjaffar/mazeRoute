function index = matchParent(openSet,x,y)
   
    i=1;
    while(openSet(i,2) ~= x || openSet(i,3) ~= y )
        i=i+1;
    end;
    index=i;
end