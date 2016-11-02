function [individuos] = ag_gera_pop( POP_SIZE )
 %POP_SIZE = 10;   
    funcoes = {'logsig','tansig','purelin'};
    funcoesBack = {'trainlm','trainbr','trainbfg','trainrp','trainscg','traincgb','traincgf','traincgp','trainoss','traingdx','traingd'};
    individuos = {};
    for i = 1:POP_SIZE
       camadas = round(rand*10)+2;
       %camadas = 3;
        n_neuronios_camada = round(rand(1,camadas)*9)+1;
        funcoes_pos = round(rand(1,camadas+1)*2)+1;
        funcoes_net = {};
        
        net_IW = rand(n_neuronios_camada(1),12);
        net_LW = {};
        net_bias = {};
        
        for j =1:camadas+1
           funcoes_net{j} = funcoes{funcoes_pos(j)}; 
           if(j<=camadas)
               net_bias{j} = rand(n_neuronios_camada(j),1);
           end
           if(j>=2 && j<=camadas)
               net_LW{j-1} = rand(n_neuronios_camada(j),n_neuronios_camada(j-1));
           end
        end
        
        net_LW{camadas} = rand(1,n_neuronios_camada(camadas));
        net_bias{camadas+1} =rand(1,1);
        %net = cria_RNA(camadas,n_neuronios_camada,funcoes_net,net_bias,net_IW,net_LW);
        individuo = {};
        individuo{1} = net_IW;
        info = {};
        for j = 1:camadas
            info{1} = net_LW{j};
            info{2} = net_bias{j};
            info{3} = funcoes_net{j};
            individuo{j+1} = info;
        end
        
        info = {net_bias{camadas+1},funcoes_net{camadas+1},rand(),funcoesBack(round(rand()*10)+1)};
        individuo{camadas+2} = info;
       
        individuos{i} = individuo;
    
    end

end

