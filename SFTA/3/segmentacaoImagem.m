function [ output ] = segmentacaoImagem(img)

output = sfta(uint8(img), 12);

end

