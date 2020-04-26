function [ a ] = randomSelect( Q , s, epsilon )

actionCount = size(Q,2);
if (rand()>epsilon) 
    a = GetBestAction(Q,s);    
else
    a = randi(actionCount);
end

