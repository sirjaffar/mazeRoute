function openSet = putInOpen(x,y,parentX,parentY,h,g,f)

openSet=[];
openSet(1,1)=1;
openSet(1,2)=x;
openSet(1,3)=y;
openSet(1,4)=parentX;
openSet(1,5)=parentY;
openSet(1,6)=h;
openSet(1,7)=g;
openSet(1,8)=f;

end