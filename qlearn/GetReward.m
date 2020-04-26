function [ r,f ] = GetReward( pos,goal )
if ( pos==goal) 
	r = 1;
    f = true;
else
    r = 0;   
    f = false;
end

    


    
