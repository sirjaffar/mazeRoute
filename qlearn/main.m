clc; clf; clear;
[maxepisodes,maxsteps,alpha,gamma,epsilon] = promptUser;
title('Q-Learning Algorithm')
[gridSize, maze, goal, start] = designWorld;


statelist = setprod((1:gridSize),(1:gridSize));
actionlist = [1;2;3;4];

nstates = size(statelist,1);
nactions = size(actionlist,1);

Q = zeros(nstates,nactions );
Model = zeros(nstates,nactions );
RandomNumber = 50;

for EP=1:maxepisodes
    x = start;
    steps = 0;
    
    total_reward = 0;
    [d  state] = min(dist(statelist,x'));
    
    action   = randomSelect(Q,state,epsilon);
    
    for i=1:maxsteps
        action = actionlist(action);
        
        xp  = DoAction( action , x, maze );
        [r,f]   = GetReward(xp,goal);
        total_reward = total_reward + r;
        [d assumeState]  = min(dist(statelist,xp'));
        ap = randomSelect(Q,assumeState,epsilon);
        
        Q = updateQ( state, action, r, assumeState, Q , alpha, gamma );
        
        Model(state,action,1) = assumeState;
        Model(state,action,2) = r;
        
        Q = randomize(Q, Model, RandomNumber, alpha, gamma);
        state = assumeState;
        action = ap;
        x = xp;
        steps=steps+1;
        
        [N M] = size(maze);
        plot(x(1)+0.5,x(2)+0.5,'kp','MarkerSize',15, 'MarkerFaceColor','r','LineWidth', 3);
        axis([1 (N+1) 1 (N+1)])
        set(gca,'XTick',1:1:N+1)
        set(gca,'YTick',1:1:N+1)
        grid on
        hold on
        plot( (start(1)+0.5), (start(2)+0.5), 'bp', 'MarkerSize',15, 'LineWidth', 2);
        text(start(1)+.2,start(2)+.2,'Robot');
        plot( (goal(1)+0.5), (goal(2)+0.5), 'gp', 'MarkerSize',15, 'LineWidth', 2);
        text(goal(1)+.2,goal(2)+.2,'Goal');
        
        [mx my] = find(maze);
        plot( (mx-.5), (my-.5), 'ks', 'MarkerSize',29, 'LineWidth', 3);
        drawnow
        pause(0.01)
        
        if (f==true)
            break
        end
        hold off
        
    end
    disp(['Espisode: ',int2str(EP),'  Steps:',int2str(steps),'  Reward:',num2str(total_reward),' epsilon: ',num2str(epsilon)])
    
end