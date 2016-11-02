
VectorTrain=[];    
Vtrain = [];
%Definindo Caminho das Imagens
srcFiles = dir('v\*');
    for i = 1 : length(srcFiles)
        %Checando se o caminho representa um arquivo ou um diretório
        if (~isdir(srcFiles(i).name))
            %Concatenando com  onome da imagem
            filename = strcat('v\',srcFiles(i).name);
            %Lendo imagem
            I = imread(filename);

            output = sfta(uint8(I), 12);
            
            VectorTrain = [VectorTrain; output];
            %Definindo classe da imagem (Sunset)
            Vtrain = [Vtrain; 1];
        end
    end

VectorTrainN = [];
VtrainN = [];
%Definindo Caminho das Imagens
srcFiles = dir('nv\*');
    for i = 1 : length(srcFiles)
        %Checando se o caminho representa um arquivo ou um diretório
        if (~isdir(srcFiles(i).name))
            %Concatenando com  onome da imagem
            filename = strcat('nv\',srcFiles(i).name);
            %Lendo imagem
            I = imread(filename);

            output = sfta(uint8(I), 12);
            
            VectorTrainN = [VectorTrainN; output];
            %Definindo classe da imagem (Sunset)
            VtrainN = [VtrainN; -1];
        end
    end

    %Treinamento
Vector = [VectorTrain;VectorTrainN];
V = [Vtrain; VtrainN];