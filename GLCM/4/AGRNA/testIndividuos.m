function [ nWTrain,nWTest ] = ag_calc_fitness( ind)
    load('features');
    in =Vector;
    out =V;
    inputs = in;
    saida = out;

    
    fitness = [];
    for i = 1 : 1
        temp =ind;
        net_LW = {};
        net_bias = {};
        n_neuronios_camada = [];
        funcoes_net = {};
        net_IW = temp{1};
        for j=2:size(temp,2)-1
            
           b = temp{j};
           net_LW{j-1}= b{1};
           net_bias{j-1} = b{2};
           funcoes_net{j-1} = b{3};
           n_neuronios_camada = [n_neuronios_camada, size(b{1},2)];
           
        end
        b = temp{j+1};
        net_bias{j} = b{1};
        funcoes_net{j} = b{2};
        learningRate = b{3};
        backFunction = b{4}
        
        net = cria_RNA(size(temp,2)-2,n_neuronios_camada,funcoes_net,net_bias,net_IW,net_LW,learningRate,backFunction);
        %net.trainParam.showWindow=0; %default is 1)
        input = inputs';
	    output = saida';
        
	    net = train(net,input,output);
	    outputs = net(input);
  %      [a b ] = find(and(in<0.53,in>0.47));
        outputs = outputs-output;
  %      outputs(:,a) = outputs(:,a)*1.2;
  %      performance = sum(sum(abs(outputs)));
        
        nWTrain = length(find(abs(outputs)>1));
         input = VectorT';
	    output = VT';
        outputs = net(input);
        outputs = outputs-output;
        nWTest = length(find(abs(outputs)>1));
      
    end

%end


