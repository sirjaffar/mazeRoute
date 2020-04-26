function [ Q ] = updateQ( s, a, r, assumeState, Q , alpha, gamma )

MaxOfQ =   ((r + gamma*max(Q(assumeState,:))) - Q(s,a));
Q(s,a) =  Q(s,a) + alpha * MaxOfQ;

