function [maxepisodes,maxsteps,alpha,gamma,epsilon] = promptUser()

answer = inputdlg({'Maximum Episodes:','Max Steps Per Episode:','Alpha (learning rate):','Gamma (Discount):','Epsilon(Random Moves Factor):'});
maxEP = answer{1};
maxepisodes = str2double(maxEP);

maxS = answer{2};
maxsteps = str2double(maxS);

alp = answer{3};
alpha = str2double(alp);

gam = answer{4};
gamma = str2double(gam);


eps = answer{5};
epsilon = str2double(eps);

end