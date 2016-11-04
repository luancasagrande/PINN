% function [ttest,ind ] = ag_controle()

%Definicoes
 POP_SIZE        = 200;
 N_GERACOES      = 100;
 TX_MUTACAO      = 0.4;


%Gera a população inicial
individuos = ag_gera_pop(POP_SIZE);

%Armazena erro mínimo
min_v = [];
%Armazena erro médio
med_v = [];
influ = [];
influ_act = 0;
% Executa as gerações
val = 1;
fitness = zeros(1, POP_SIZE);
%load('work');
for i = 1 : N_GERACOES
    if (i>1)
        val = POP_SIZE/2;
    end
    %Calcula fitness
    [fitness, individuos] = ag_calc_fitness(individuos,val,fitness);
       
    %
    min_v = [min_v; min(fitness)];
    
    soma = sum(fitness(find(~isinf(fitness))));
    nele = length(fitness(find(~isinf(fitness))));
     
    
    med_v = [med_v;  soma/nele];
    
    %Ordenação
    [ individuos,fitness ] = ag_sort( individuos,fitness,POP_SIZE);
    
%    vec = s_fitness(find(s_fitness(1:11)));
%    if(i>1)
%        for j=1:length(vec)
%            temp = find(vec(j)==fitness(12:20));
%            if(~isempty(temp))
%                influ_act = influ_act + 1;
%            end
%        end
%    end
%    influ = [influ; influ_act];
    save('work');
    min_v
    if (i<N_GERACOES)
        %Crossover
        individuos = ag_crossover(individuos);
        
        %Mutação
        [individuos, qtde_mutada] = ag_mutation(individuos, TX_MUTACAO);
    end
end
% 
%  text = ['Dados25/',nome];
%  save(text);
%  
ind = individuos{1};
ttest =min(fitness);


 %end
