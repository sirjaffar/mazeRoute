function Q = randomize(Q, Model, steps, alpha, gamma )

[s_list a_list] = find(Model(:,:,1));

for j=1:steps
    i = randi(numel(s_list));
    s = s_list(i);
    a = a_list(i);
    sp = Model(s,a,1);
    r = Model(s,a,2);
    Q = updateQ( s, a, r, sp, Q , alpha, gamma );
    
end
end