function [ a ] = GetBestAction( Q, s )
nactions=size(Q,2);

[v idx]    = sort(Q(s,:),'descend');
x          = diff(v);
i          = find(x,1);

if isempty(i)
    a = randi(nactions);
else
    j = randi(i);
    a = idx(j);
end

end