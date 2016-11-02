 function [ fitness, individuos] = ag_calc_fitness( individuos,val,fitness)
    warning('off','all')

    
    
    load('features4');
    in =Vector;
    out =V;
    inputs = in;
    saida = out;

    cont = 0;
    n = size(individuos,2);
    nWTrain = [];
    nWTest = [];
    for i = val : length(individuos)
        temp =individuos{i};
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
        backFunction = b{4};
        
        net = cria_RNA(size(temp,2)-2,n_neuronios_camada,funcoes_net,net_bias,net_IW,net_LW,learningRate,backFunction);
        %net.trainParam.showWindow=0; %default is 1)
        input = inputs';
	    output = saida';
        
	    net = train(net,input,output);

        
        outputs = net(VectorT');
        outputs(find(isnan(outputs))) = 10;
        outputs(find(outputs>=0.5)) = 1;
        outputs(find(outputs<0.5)) = 0;
        
        a = 194;
        b = 357;

        xTest = zeros(a,b);
        vCheck = zeros(a,b);
%Adjusting the output from blockproc
        for k = 1:a
            for j = 1:b

                xTest(k,j) = outputs((k-1)*357+j);
                vCheck(k,j) = VT((k-1)*357+j);
            end
        end
            
        
        B=ones(3); B(2,2)=0; % Count neighbors, not self
        live=conv2(xTest,B,'same');
        xTest(:,:)=live(:,:)>=4;
        
        o = xTest - vCheck;
       
        fitness(i) = sum(sum(abs(o)));
        
        temp{1} = net.IW{1};
        net_bias = net.b';
        for j =2:length(temp)-1
            temp{j}{1} = net.lw{j,j-1};
            temp{j}{2} = net_bias{j-1};
            temp{j}{3} = net.layers{j-1}.transferFcn;
        end
        j = length(temp);
        temp{j}{1} = net_bias{j-1};
        temp{j}{2} = net.layers{j-1}.transferFcn;
        individuos{i} = temp;
    end

 end

