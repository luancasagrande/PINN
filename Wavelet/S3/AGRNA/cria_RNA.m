function [net] = cria_RNA(camadas,n_neuronios_camada,funcoes,net_bias,net_IW,net_LW,learningRate,backFunction)
    load('maxminNN');
    net = newff(c,[n_neuronios_camada,1],funcoes);
    
    
    net.trainFcn = backFunction{1};
    
    
    net.trainParam.lr = learningRate; % Learning rate used in some gradient schemes
    net.trainParam.epochs =1000; % Max number of iterations
    
    net.IW{1,1} = net_IW;
    net.b=net_bias';
    for i = 2:camadas+1
       net.LW{i,i-1}= net_LW{i-1};
    end
    
end
 