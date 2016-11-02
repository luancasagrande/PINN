clear
clc

%The factor of downsampling for columns and rows
d1 = 5;
d2 = 5;

%Creating Gabor Filter Bank


%Necessário por falta de memória
fun = @(block_struct)segmentacaoImagem(block_struct.data,4,5,19);
%Tamanho do Bloco
block_size = [100 100];
%Executando o processamento em bloco
output = blockproc('outputGABOR.tif',block_size,fun);


[a,b] = size(output);
b=b/8000;
xTest = [];
%Adjusting the output from blockproc
for i = 1:a
    for j = 1:b
        
        xTest = [xTest; output(i,((j-1)*8000)+1:(j*8000))];
    end
end
%
clear a b block_size fun i j output 



 fun = @(block_struct)checkClass(block_struct.data);
 %Tamanho do Bloco
 block_size = [100 100];
 %Executando o processamento em bloco
 classe = blockproc('test.tif',block_size,fun);

 [a b] = size(classe);
 outClasse = [];
 for i = 1 : a
     for j = 1 : b
         outClasse = [outClasse;classe(i,j)]; 
     end
 end