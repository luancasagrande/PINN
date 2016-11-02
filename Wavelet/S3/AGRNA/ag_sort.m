function [ s_individuos,s_fitness ] = ag_sort( individuos,fitness, tamanho)
s_fitness = [];
fitness(find(isnan(fitness))) = 1;

i=1;
while(i<=tamanho)
    pos = find(min(fitness)==fitness);
    for j=1:length(pos)
        s_fitness = [s_fitness;fitness(pos(j))];
        
        fitness(pos(j))=NaN;
        s_individuos{i} = individuos(pos(j));
        i = i + 1;
    end
end

end

