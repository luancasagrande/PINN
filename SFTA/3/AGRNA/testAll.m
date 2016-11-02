
test = [];
train = [];

for i = 1 : 1
    ind = {nInd{5}};
    ind = ind{1};
    [a,b] = testIndividuos(ind);
    test = [test;a];
    train = [train;b];
end