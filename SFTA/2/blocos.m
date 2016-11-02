clear
clc


%Necessário por falta de memória
fun = @(block_struct)segmentacaoImagem(block_struct.data);
%Tamanho do Bloco
block_size = [100 100];
%Executando o processamento em bloco
output = blockproc('outputSemAgua.tif',block_size,fun);


[a,b] = size(output);
b=b/(6*12);
xTest = [];
%Adjusting the output from blockproc
for i = 1:a
    for j = 1:b
        
        xTest = [xTest; output(i,((j-1)*6*12)+1:(j*6*12))];
    end
end
%
clear a b block_size fun i j output 

 save('dataSemAgua');

 fun = @(block_struct)checkClass(block_struct.data);
 %Tamanho do Bloco
 block_size = [100 100];
 %Executando o processamento em bloco
 classe = blockproc('test.tif',block_size,fun);

 [a b] = size(classe);
 outClasse = [];
 for i = 1 : a
     for j = 1 : b
         outClasse = classe(i,j); 
     end
 end
 
 save('dataSemAgua');